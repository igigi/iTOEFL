class UserSerializer < ApplicationSerializer
  attributes :id, :origin, :open_id, :password, :auth_token, :nickname
end
