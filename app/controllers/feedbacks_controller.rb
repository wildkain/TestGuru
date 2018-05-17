class FeedbacksController < ApplicationController
  before_action :set_reference, only: :create

  def new
    @feedback = Feedback.new
    @feedback[:email] = current_user.email if user_signed_in?
  end

  def create
    if @feedback.save
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: "Feedback successfeully sended"
    else
      render :new
    end
  end

  private

  def set_reference
    if user_signed_in?
      @feedback = current_user.feedbacks.build(feedback_params)
    else
      @feedback = Feedback.new(feedback_params)
    end
  end

  def feedback_params
    params.require(:feedback).permit(:body, :email, :user_id)
  end
end