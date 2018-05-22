# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show result update gist]
  before_action :authenticate_user!
  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      service = BadgeDistributorService.new(@test_passage)
      service&.assign_badges
      redirect_to result_test_passage_path(@test_passage), notice: 'You recieve a Badge' if service.badge_given?
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if successed?(result)
      current_user.gists.create(question_id: @test_passage.current_question_id, path: result.html_url)
      flash[:notice] = t('.success', gist_url: view_context.link_to('Gist', result.html_url, target: '_blank'))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  def successed?(result)
    result.created_at.present?
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
