json.array!(@questions) do |question|
  json.extract! question, :id, :content, :tip, :related_resource, :set, :number, :subject, :source, :difficulty
  json.url question_url(question, format: :json)
end
