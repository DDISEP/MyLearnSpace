class Materialvideo < ActiveRecord::Base

  attr_accessible :title, :file, :user_id

  validates :title, presence: true
  validates :user_id, presence: true

  #has_attached_file :file, :styles => {
  #    :medium => { :geometry => "640x480", :format => 'flv'},
  #    :thumb => {:geometry => "100x100#", :format => 'jpg', :time => 10}
  #}, :processors => [:transcoder]
  #}, :processors => [:ffmpeg]

  has_attached_file :file,
                    :url  => "/assets/products/videos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/videos/:id/:style/:basename.:extension"

  validates_attachment_presence :file
  validates_attachment_size :file, :less_than => 50.megabytes
  validates_attachment_content_type :file, :content_type => ['video/mp4', "video/mov", "video/mpeg","video/mpeg4", "video/flv"]

  has_one :users
  has_and_belongs_to_many :knowledge_elements

end
