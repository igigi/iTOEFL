json.array!(@question_histories) do |question_history|
  json.extract! question_history, :id, :user_id, :question_id, :is_correct, :answer
  json.url question_history_url(question_history, format: :json)
end
