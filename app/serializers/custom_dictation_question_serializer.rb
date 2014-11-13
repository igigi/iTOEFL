class CustomDictationQuestionSerializer < ActiveModel::Serializer
  attributes :id, :audio_url, :sample
end
