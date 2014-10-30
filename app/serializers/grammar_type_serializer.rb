class GrammarTypeSerializer < ActiveModel::Serializer
  embed :ids
  attributes :name
  has_many :grammar_groups
end
