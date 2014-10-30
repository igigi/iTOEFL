class TaskSerializer < ApplicationSerializer
  attributes :id, :is_correct, :answer, :status, :created_at, :question
end
