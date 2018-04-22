module QuestionsHelper
  def question_header(resource)
    if @question.new_record?
      "Create NEW | Test: #{resource.title}| question"
    else
      "Edit |Test: #{resource.title}| question"
    end
  end
end
