class FeedbacksController < ApplicationController


  def new
    @feedback = Feedback.new(email: current_user&.email)
  end

  def create
    feedback = Feedback.new(feedback_params.merge(user: current_user))
    if feedback.save
      FeedbacksMailer.send_feedback(feedback).deliver_now
      redirect_to root_path, notice: "Feedback successfeully sended"
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body, :email)
  end
end