class JinghuaMarkSerializer < ActiveModel::Serializer
  attributes :id, :content, :score, :audio_length, :created_at, :user
  # has_one :user

  def user
    profile = object.user.profile
    {
      id: 1, avatar: object.avatar, nickname: object.nickname, gender: profile.gender, grade: profile.grade, phone: profile.phone,
      user_id: profile.user_id, created_at: profile.created_at, updated_at: profile.updated_at, role: profile.role
    }
  end
end
