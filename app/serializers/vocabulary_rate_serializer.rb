class VocabularyRateSerializer < ActiveModel::Serializer
  attributes :id, :rate, :created_at
  has_one :vocabulary_group
end
