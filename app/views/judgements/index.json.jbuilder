json.array!(@judgements) do |judgement|
  json.extract! judgement, :id, :score, :mark_id, :user_id
  json.url judgement_url(judgement, format: :json)
end
