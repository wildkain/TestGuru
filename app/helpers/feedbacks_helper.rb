module FeedbacksHelper

  def feedback_author_name(feedback)
    feedback.user&.fullname || 'Anonymous'
  end
end