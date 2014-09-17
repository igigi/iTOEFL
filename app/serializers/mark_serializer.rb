class MarkSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :question_history
  has_one :user
end
