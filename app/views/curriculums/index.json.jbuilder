json.array!(@curriculums) do |cur|
  json.extract! cur, :country, :state, :level, :profession, :subject, :typeOfSchool
  json.url cur_url(cur, format: :json)
end
