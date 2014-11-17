class GrammarRateSerializer < ActiveModel::Serializer
  attributes :rate
  has_one :grammar_group
end
