class JinghuaAnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :remark, :audio_length, :created_at, :user

  def user
  	object.user.profile
  end
  has_many :jinghua_marks
  has_one :jinghua_question
end
