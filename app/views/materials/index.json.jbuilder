json.array!(@materials) do |material|
  json.extract! material, :id
  json.url material_url(material, format: :json)
end
