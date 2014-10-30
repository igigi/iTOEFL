class VocabularyGroupSerializer < ActiveModel::Serializer
  attributes :id
  has_many :vocabulary_questions
end
