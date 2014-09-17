class JudgementSerializer < ActiveModel::Serializer
  attributes :id, :score
  has_one :mark
  has_one :user
end
