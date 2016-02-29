json.array!(@materialvideos) do |materialvideo|
  json.extract! materialvideo, :id, :title, :file, :filename, :fileformat, :user_id
  json.url materialvideo_url(materialvideo, format: :json)
end
