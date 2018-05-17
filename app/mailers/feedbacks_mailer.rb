class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.first.email }


  def send_feedback(feedback)
    @feedback = feedback
    mail  from: @feedback.email, subject: "Feedback from #{@user&.fullname}"
  end

end
