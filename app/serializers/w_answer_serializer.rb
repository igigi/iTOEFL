class WAnswerSerializer < ActiveModel::Serializer
  attributes :id, :standpoint, :content
  has_one :tpo_question
  has_one :user
end
