class JijingSampleSerializer < ActiveModel::Serializer
  attributes :id, :content, :user
  has_one :user

  def user
  	object.user.profile
  end
end
