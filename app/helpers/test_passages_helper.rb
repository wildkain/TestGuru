module TestPassagesHelper
  def count_progress_percent(test_passage)
    test_passage.current_question_number*100/test_passage.test.questions.count
  end
end
