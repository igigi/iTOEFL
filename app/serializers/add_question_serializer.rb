class AddQuestionSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :mark
  has_one :user
end
