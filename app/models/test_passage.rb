# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true

  before_validation :before_validation_set_questions

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def time_left
    start =  created_at
    timer =  test.timer
    end_time = start + (timer * 60)
    end_time - Time.zone.now
  end

  def time_over?
    time_left < 0
  end

  def time_end
    (created_at + (test.timer * 60))
  end

  def success?
    count_percent_correct > 85
  end

  def count_percent_correct
    (correct_questions * 100) / number_of_questions
  end

  def current_question_number
    number_of_questions - collect_questions.count
  end

  def number_of_questions
    test.questions.count
  end

  def next_question
    collect_questions.first
  end

  def completed
    self.current_question = nil
  end
  private

  def before_validation_set_questions
    if new_record?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def collect_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end
end
