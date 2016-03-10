class Materialvideo < ActiveRecord::Base

  attr_accessible :title, :file, :user_id

  #validates :title, presence: true
  #validates :user_id, presence: true

  #has_attached_file :file, :styles => {
  #                                      :medium => { :geometry => "640x480", :format => 'flv' },
  #                                      :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
  #                                    },
  #                  :processors => [:transcoder]

  #has_attached_file :file, styles: {
  #    :medium => {
  #        :geometry => "640x480",
  #        :format => 'mp4'
  #    },
  #    :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
  #}, :processors => [:transcoder]

  #has_attached_file :video, :styles => {
  #    :mp4 => { :format => 'mp4', :convert_options => { :output => { :vcodec => 'libx264', :acodec => 'copy' } } },
  #    :ogg => { :format => 'ogg', :auto_rotate => true  },
  #    :webm => { :format => 'webm', :auto_rotate => true  },
  #    :flv => { :format => 'flv', :convert_options => { :output => { :ar => 44100 } }, :auto_rotate => true  },
  #    :thumb => { :geometry => "300x300#", :format => 'jpg', :time => 1, :auto_rotate => true }
  #}, :processors => [:transcoder]

  has_attached_file :file, :styles => {
      :medium => { :geometry => "640x480", :format => 'flv'},
      :thumb => {:geometry => "100x100#", :format => 'jpg', :time => 10}
  }, :processors => [:ffmpeg]
  do_not_validate_attachment_file_type(:file)

  #validates_attachment_presence :file
  #validates_attachment_size :file, :less_than => 25.megabytes
  #validates_attachment_content_type :file, :content_type => ['video/mp4', 'image/png', 'image/gif']

  has_one :users
  has_and_belongs_to_many :knowledge_elements

end
