json.array!(@materialpictures) do |materialpicture|
  json.extract! materialpicture, :id, :title, :file, :user_id
  json.url materialpicture_url(materialpicture, format: :json)
end
