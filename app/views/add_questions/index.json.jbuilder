json.array!(@add_questions) do |add_question|
  json.extract! add_question, :id, :content, :mark_id, :user_id
  json.url add_question_url(add_question, format: :json)
end
