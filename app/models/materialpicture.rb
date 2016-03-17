class Materialpicture < ActiveRecord::Base

  attr_accessible :title, :file, :user_id, :knowledge_element_id, :file_file_name, :file_content_type, :file_file_size

  validates :title, presence: true
  validates :user_id, presence: true
  validates :knowledge_element_id, presence: true

  has_attached_file :file,
                    :url  => "/assets/materials/pictures/:id/:basename.:extension",
                    :path => ":rails_root/public/assets/materials/pictures/:id/:basename.:extension"

  validates_attachment_presence :file
  validates_attachment_size :file, :less_than => 5.megabytes
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']

  has_one :users
  has_one :knowledge_elements

end
