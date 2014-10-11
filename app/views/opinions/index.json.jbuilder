json.array!(@opinions) do |opinion|
  json.extract! opinion, :id, :content, :media_url, :seat, :discussion_id, :user_id
  json.url opinion_url(opinion, format: :json)
end
