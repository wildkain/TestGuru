class FeedbacksMailer < ApplicationMailer
  default to: Admin.first.email


  def send_feedback(feedback)
    @feedback = feedback
    @user = @feedback&.user
    mail  from: @feedback.email, subject: "Feedback from #{@user&.fullname}"
  end

end
