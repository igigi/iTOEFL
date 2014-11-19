class VocabularyRateSerializer < ActiveModel::Serializer
  attributes :id, :rate
  has_one :vocabulary_group
end
