class QuestionHistorySerializer < ApplicationSerializer
  attributes :id, :is_correct, :answer
  has_one :user
  has_one :question
end
