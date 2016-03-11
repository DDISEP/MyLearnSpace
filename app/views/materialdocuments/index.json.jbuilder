json.array!(@materialdocuments) do |materialdocument|
  json.extract! materialdocument, :id, :title, :user_id
  json.url materialdocument_url(materialdocument, format: :json)
end
