class CustomArticleMarkSerializer < ActiveModel::Serializer
  attributes :id, :score, :created_at, :article, :user, :jijing_question
  has_many :mark_tips

  def article
  	{content: "#{object.article.content}"}
  end

  def user
  	 object.article.user.profile
  end

  def jijing_question
  	{ content: object.article.jijing_question.content, title: object.article.jijing_question.jijing_group.name }
  end
end
