json.array!(@exerciseoverviews) do |exerciseoverview|
  json.extract! exerciseoverview, :id
  json.url exerciseoverview_url(exerciseoverview, format: :json)
end
