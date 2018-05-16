module FeedbacksHelper

  def feedback_author_name(feedback)
    if feedback.user.nil?
      "Undefined"
      else
    feedback.user.firstname + ' ' + feedback.user.lastname
    end
  end
end