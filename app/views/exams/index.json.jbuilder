json.array!(@exams) do |exam|
  json.extract! exam, :id, :maxPoints, :minPoints, :maxTime
  json.url exam_url(exam, format: :json)
end
