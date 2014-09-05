json.array!(@recorded_broadcasts) do |recorded_broadcast|
  json.extract! recorded_broadcast, :id, :title, :cover, :summary, :video_url, :broadcast_set_id
  json.url recorded_broadcast_url(recorded_broadcast, format: :json)
end
