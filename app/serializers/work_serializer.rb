class WorkSerializer < ActiveModel::Serializer
  attributes :id, :standpoint, :content, :created_at
  has_one :user
end
