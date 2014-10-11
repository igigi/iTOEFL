json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :content, :media_url, :user_id
  json.url discussion_url(discussion, format: :json)
end
