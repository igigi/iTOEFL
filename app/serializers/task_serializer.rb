class TaskSerializer < ApplicationSerializer
  attributes :id, :is_correct, :answer
  def status
    object.marks.empty? ? 0:1
  end
end
