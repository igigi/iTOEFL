# encoding: utf-8

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content_id, :content, :content_type, :is_readed, :created_at

  private
  def is_readed
    object.is_readed ? true : false
  end
end
