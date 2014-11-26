class MarkTipSerializer < ActiveModel::Serializer
  attributes :id, :start_index, :end_index, :audio_url, :text_content
end
