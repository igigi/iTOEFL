json.array!(@broadcast_sets) do |broadcast_set|
  json.extract! broadcast_set, :id, :title, :description, :cover
  json.url broadcast_set_url(broadcast_set, format: :json)
end
