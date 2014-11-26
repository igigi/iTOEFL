class JinghuaMarkSerializer < ActiveModel::Serializer
  attributes :id, :content, :score, :audio_length, :created_at, :user

  def user
  	object.user.profile
  end
end
