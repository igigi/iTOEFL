class OralQuestionSerializer < ActiveModel::Serializer
  attributes :id, :data_url, :original_text, :sequence_number
end
