class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
    render inline: "<% @questions.each do |q|%><p><%= q.body %></p><%end%>"
  end

  def show
    render inline: "<h2><%=@question.body%></h2>"
  end

  def create
    question = @test.questions.create(question_params)
    render html: '<h1> Question created!</h1>'.html_safe
  end

  def destroy
    @question.destroy
    redirect_to :index
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
    render plain: "Question was not found, sorry."
  end
end
