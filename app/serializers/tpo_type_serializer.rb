class TpoTypeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tpo_questions
end
