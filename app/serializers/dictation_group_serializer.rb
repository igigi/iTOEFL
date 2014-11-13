class DictationGroupSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :dictation_questions
end
