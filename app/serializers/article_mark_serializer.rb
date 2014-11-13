class ArticleMarkSerializer < ActiveModel::Serializer
  attributes :id, :score, :created_at, :user
  has_many :mark_tips
  has_one :article_judgement

  def user
  	object.user.profile
  end
end
