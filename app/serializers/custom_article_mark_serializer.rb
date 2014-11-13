class CustomArticleMarkSerializer < ActiveModel::Serializer
  attributes :id, :score, :created_at, :article, :user
  has_many :mark_tips
  has_one :article_judgement

  def article
  	{content: "#{object.article.content}"}
  end

  def user
  	object.article.user.profile
  end
end
