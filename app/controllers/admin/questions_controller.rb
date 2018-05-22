# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :find_question, only: %i[show destroy edit]
  before_action :find_test, only: %i[index new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def show; end

  def edit; end

  def create
    if @test.questions.create(question_params)
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  def new
    @question = @test.questions.new
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found, sorry.'
  end
end
