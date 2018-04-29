class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show destroy edit update start]


  def index
    @tests = Test.all
  end

  def edit; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.create(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def show
    @questions = @test.questions
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :category_id, :level, :author_id)
  end


  def find_test
    @test = Test.find(params[:id])
  end
end
