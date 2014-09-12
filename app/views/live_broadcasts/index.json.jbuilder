json.array!(@live_broadcasts) do |live_broadcast|
  json.extract! live_broadcast, :id, :title, :cover, :summary, :video_url, :start_at
  json.url live_broadcast_url(live_broadcast, format: :json)
end
