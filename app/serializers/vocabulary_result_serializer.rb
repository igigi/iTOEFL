class VocabularyResultSerializer < ActiveModel::Serializer
  attributes :id
  has_one :vocabulary_question
end
