json.array!(@questions) do |question|
  json.extract! question, :title, :text, :creationdate
  json.url question_url(question, format: :json)
end
