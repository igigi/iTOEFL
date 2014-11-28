# encoding: utf-8

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content_id, :content, :content_type, :is_readed, :created_at

end
