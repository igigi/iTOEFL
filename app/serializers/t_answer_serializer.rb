class TAnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :is_shared, :status
  has_one :tpo_question
  has_one :user
end
