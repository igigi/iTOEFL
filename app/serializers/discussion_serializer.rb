class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :content, :media_url, :media_type, :media_length, :created_at, :favorite_count, :reply_count
  has_one :user
end
