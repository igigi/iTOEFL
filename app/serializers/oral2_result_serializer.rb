class Oral2ResultSerializer < ActiveModel::Serializer
  attributes :id, :score, :audio, :user

  def user
  	object.user.profile
  end
end
