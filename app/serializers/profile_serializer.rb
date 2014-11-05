class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :nickname, :gender, :grade, :phone
end
