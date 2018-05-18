class Admin::FeedbacksController < Admin::BaseController

  def index
    @feedbacks = Feedback.includes(:user)

  end

  def show

  end
end