class TpoGroupSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tpo_types
end
