class ArticleMarkSerializer < ActiveModel::Serializer
  attributes :id, :score, :user
  has_many :mark_tips

  def user
  	object.user.profile
  end
end
