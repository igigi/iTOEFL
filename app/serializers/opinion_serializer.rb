class OpinionSerializer < ActiveModel::Serializer
  attributes :id, :content, :media_url, :seat, :media_type, :media_length
  has_one :discussion
  has_one :user
end
