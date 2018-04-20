module QuestionsHelper
  def question_header(resource)
    if @question.new_record?
      "Create NEW | Test: #{resource.test.title}| question"
    else
      "Edit |Test: #{resource.test.title}| question"
    end
  end
end
