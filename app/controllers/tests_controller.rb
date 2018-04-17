class TestsController < ApplicationController

  before_action :find_test, only: [:show, :destroy]

  def index
    @tests  = Test.all
  end

  def new
  end

  def create
    @test = Test.create(tests_params)
  end

  def show
    @test
  end

  def update
  end

  def destroy
  end

  private

  def test_params
    params.require(:test).permit(:title, :category_id, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
