class CustomArticleMarkSerializer < ActiveModel::Serializer
  attributes :id, :score, :created_at, :article, :user, :jijing_question
  has_many :mark_tips

  def article
  	{content: "#{object.article.content}"}
  end

  def user
  	# object.article.user.profile
    profile = object.article.user.profile
    {
      id: 1, avatar: object.avatar, nickname: object.nickname, gender: profile.gender, grade: profile.grade, phone: profile.phone,
      user_id: profile.user_id, created_at: profile.created_at, updated_at: profile.updated_at, role: profile.role
    }
  end

  def jijing_question
  	{ content: object.article.jijing_question.content, title: object.article.jijing_question.jijing_group.name }
  end
end
