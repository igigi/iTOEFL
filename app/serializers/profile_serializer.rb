class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :nickname, :gender, :grade, :phone, :role

  def avatar
  	object.avatar.url
  end
end
