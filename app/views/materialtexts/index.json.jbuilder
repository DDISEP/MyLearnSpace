json.array!(@materialtexts) do |materialtext|
  json.extract! materialtext, :id, :title, :text, :user_id
  json.url materialtext_url(materialtext, format: :json)
end
