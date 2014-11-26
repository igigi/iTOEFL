class CustomJijingAnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :remark, :audio_length, :created_at, :user

  def user
  	object.user.profile
  end
  has_one :jijing_question
end
