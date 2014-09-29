class QuestionSerializer < ApplicationSerializer
  attributes :id, :content, :tip, :related_resource, :difficulty, :my_history

  def my_history
    Task.myself_history(object.id, current_user.id)
  end
end
