class QuestionSerializer < ApplicationSerializer
  attributes :id, :content, :tip, :related_resource, :difficulty, :my_history

  def my_history
    QuestionHistory.myself_history(object.id, current_user.id).ids
  end
end
