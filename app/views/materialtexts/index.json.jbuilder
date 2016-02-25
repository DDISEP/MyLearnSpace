json.array!(@materialtexts) do |materialtext|
  json.extract! materialtext, :id, :title, :text
  json.url materialtext_url(materialtext, format: :json)
end
