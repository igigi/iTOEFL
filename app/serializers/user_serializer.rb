class UserSerializer < ApplicationSerializer
  attributes :id, :origin, :open_id, :auth_token, :nickname, :password
end
