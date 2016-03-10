class Materialvideo < ActiveRecord::Base

  attr_accessible :title, :file, :user_id

  validates :title, presence: true
  validates :user_id, presence: true

  has_attached_file :file,
                    :url  => "/assets/products/videos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/videos/:id/:style/:basename.:extension",
                    #:processors => [:transcoder]
                    :processors => [:ffmpeg]

  validates_attachment_presence :file
  validates_attachment_size :file, :less_than => 20.megabytes
  validates_attachment_content_type :file, :content_type => ['video/mp4']#, "video/x-matroska", "video/x-flv", "video/webm", "video/x-msvideo", "video/avi", "video/mpeg"]
  #do_not_validate_attachment_file_type :file

  has_one :users
  has_and_belongs_to_many :knowledge_elements

end
