# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show destroy edit update start update_inline]

  def index; end

  def edit; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authored_tests.build(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def show
    @questions = @test.questions
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :level, :timer)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
