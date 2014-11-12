class ArticleMarkSerializer < ActiveModel::Serializer
  attributes :id, :score, :created_at, :user
  has_many :mark_tips

  def user
  	object.user.profile
  end
end
