class DictationQuestionSerializer < ActiveModel::Serializer
  attributes :id, :audio_url, :sample
  has_one :dictation_group
end
