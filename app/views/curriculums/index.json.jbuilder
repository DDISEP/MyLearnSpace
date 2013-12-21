json.array!(@curriculums) do |cur|
  json.extract! cur, :tag
  json.url cur_url(cur, format: :json)
end
