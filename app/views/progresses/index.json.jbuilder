json.array!(@progresses) do |progress|
  json.extract! progress, :id
  json.url progress_url(progress, format: :json)
end
