class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  def validate_answer_count
    errors.add(:question, "Only from 1 to 4 answers allowed") if question.answers >= 4
  end
end
