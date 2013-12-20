json.array!(@questions) do |question|
  json.extract! question, :title, :text
  json.url question_url(question, format: :json)
end
