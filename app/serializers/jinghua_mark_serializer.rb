class JinghuaMarkSerializer < ActiveModel::Serializer
  attributes :id, :content, :score
  has_one :user
end
