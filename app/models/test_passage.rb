class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question


  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def go_next_question
    self.current_question = next_question.first if !next_question.first.nil?
  end

  def success?
    self.count_percent > 85
  end

  def count_percent
    (correct_questions * 100) / number_of_questions
  end

  def current_question_number
    number_of_questions - next_question.count
  end

  def number_of_questions
    test.questions.count
  end

  private

  def before_validation_set_first_question
    if new_record?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question.first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
