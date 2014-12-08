class CustomJinghuaAnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :remark, :audio_length, :created_at

  has_one :user

  def user
  	object.user.profile
  end
  has_one :jinghua_question
  has_many :jinghua_marks
end
