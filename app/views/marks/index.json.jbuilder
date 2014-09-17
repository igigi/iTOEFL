json.array!(@marks) do |mark|
  json.extract! mark, :id, :content, :question_history_id, :user_id
  json.url mark_url(mark, format: :json)
end
