json.array!(@knowledge_elements) do |knowledge_element|
  json.extract! knowledge_element, :tag
  json.url knowledge_element_url(knowledge_element, format: :json)
end
