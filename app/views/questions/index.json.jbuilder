json.array!(@questions) do |question|
  json.extract! question, :id, :subject, :description
  json.url question_url(question, format: :json)
end
