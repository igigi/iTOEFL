class GrammarGroupSerializer < ActiveModel::Serializer
  attributes :id, :sequence_number
  has_many :grammar_questions
end
