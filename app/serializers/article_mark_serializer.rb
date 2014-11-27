class ArticleMarkSerializer < ActiveModel::Serializer
  attributes :id, :score, :created_at, :user
  has_many :mark_tips
  has_one :article_judgement

  def user
  	# object.user.profile
    profile = object.user.profile
    {
      id: 1, avatar: object.avatar, nickname: object.nickname, gender: profile.gender, grade: profile.grade, phone: profile.phone,
      user_id: profile.user_id, created_at: profile.created_at, updated_at: profile.updated_at, role: profile.role
    }
  end
end
