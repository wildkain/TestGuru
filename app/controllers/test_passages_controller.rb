class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show result update gist]
  before_action :authenticate_user!
  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    flash_options = if result.created_at
                      gist = current_user.gists.build(question_id: @test_passage.current_question_id, path: result.html_url)
                      gist.save
                      { notice: t('.success', gist_url: view_context.link_to('Gist', result.html_url, :target => '_blank'))}
                    else
                      { alert: t('.failure')  }
                    end

    redirect_to @test_passage, flash_options
  end

  def create_link(result)
    link_to 'View GIST on Github', result.github_pull_url
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
