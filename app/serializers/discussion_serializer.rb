class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :content, :media_url, :media_type, :media_length
  has_one :user
end
