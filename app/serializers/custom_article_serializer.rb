class CustomArticleSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user
  def user
  	object.user.profile
  end
end