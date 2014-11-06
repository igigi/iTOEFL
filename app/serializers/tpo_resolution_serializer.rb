class TpoResolutionSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :tpo_question
  has_one :user
end
