class JijingMarkSerializer < ActiveModel::Serializer
  attributes :id, :content, :jijing_answer, :score
  has_one :user
end
