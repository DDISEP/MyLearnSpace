json.array!(@newsfeeds) do |newsfeed|
  json.extract! newsfeed, :id, :subject, :message, :newsfeedToAll
  json.url newsfeed_url(newsfeed, format: :json)
end
