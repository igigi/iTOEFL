class DictationResultSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :dictation_question
end
