class UserSerializer < ApplicationSerializer
  attributes :id, :origin, :open_id, :auth_token, :nickname, :password

  private
  def nickname
    object.profile.nickname
  end
end
