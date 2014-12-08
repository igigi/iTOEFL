class CustomJijingAnswerSerializer < ActiveModel::Serializer
  attributes :id, :content, :remark, :audio_length, :created_at, :user
  has_one :user

  def user
  	object.user.profile
  end
  has_one :jijing_question
  has_many :jijing_marks
end
