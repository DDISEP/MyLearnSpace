json.array!(@knowledge_elements) do |content|
  json.extract! content, :tag
  json.url content_url(content, format: :json)
end
