class CustomJinghuaAnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :remark, :audio_length, :created_at, :user

  def user
  	object.user.profile.avatar.url
  end
  has_one :jinghua_question
  has_many :jinghua_marks
end
