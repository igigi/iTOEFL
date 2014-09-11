json.array!(@users) do |user|
  json.extract! user, :id, :origin, :open_id, :password, :auth_token, :nickname
  json.url user_url(user, format: :json)
end
