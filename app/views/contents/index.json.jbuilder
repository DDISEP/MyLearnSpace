json.array!(@contents) do |content|
  json.extract! content, :tag
  json.url content_url(content, format: :json)
end
