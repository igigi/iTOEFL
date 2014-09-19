class MarkSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :task
  has_one :user
end
