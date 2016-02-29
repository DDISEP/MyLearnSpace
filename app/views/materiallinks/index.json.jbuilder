json.array!(@materiallinks) do |materiallink|
  json.extract! materiallink, :id, :title, :link, :user_id
  json.url materiallink_url(materiallink, format: :json)
end
