json.array!(@rb_comments) do |rb_comment|
  json.extract! rb_comment, :id, :content, :user_id, :recorded_broadcast_id
  json.url rb_comment_url(rb_comment, format: :json)
end
