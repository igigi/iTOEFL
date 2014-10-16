class OpinionSerializer < ActiveModel::Serializer
  attributes :id, :content, :media_url, :seat, :media_type, :media_length, :status, :created_at, :favorite_count
  has_one :user
  has_one :owner
end
