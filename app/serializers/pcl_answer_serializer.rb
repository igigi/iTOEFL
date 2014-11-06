class PclAnswerSerializer < ActiveModel::Serializer
  attributes :id, :section_number, :is_correct, :option
  has_one :tpo_question
  has_one :user
end
