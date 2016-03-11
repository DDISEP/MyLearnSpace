class Materialdocument < ActiveRecord::Base

  attr_accessible :title, :file, :user_id

  validates :title, presence: true
  validates :user_id, presence: true

  has_attached_file :file,
                    :url  => "/assets/materials/documents/:id/:basename.:extension",
                    :path => ":rails_root/public/assets/materials/documents/:id/:basename.:extension"

  validates_attachment_presence :file
  validates_attachment_size :file, :less_than => 5.megabytes
  # TODO excel powerpoint und jewils open document
  #validates_attachment_content_type :file, :content_type => ['text/plain', 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.oasis.opendocument.text']
  do_not_validate_attachment_file_type :file

  has_one :users
  has_and_belongs_to_many :knowledge_elements

end
