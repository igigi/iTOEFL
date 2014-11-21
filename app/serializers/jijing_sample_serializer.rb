class JijingSampleSerializer < ActiveModel::Serializer
  attributes :id, :content, :user

  def user
  	object.user.profile
  end
end
