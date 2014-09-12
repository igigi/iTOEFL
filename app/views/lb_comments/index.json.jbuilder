json.array!(@lb_comments) do |lb_comment|
  json.extract! lb_comment, :id, :content, :user_id, :live_broadcast_id
  json.url lb_comment_url(lb_comment, format: :json)
end
