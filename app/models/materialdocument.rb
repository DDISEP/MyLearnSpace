class Materialdocument < ActiveRecord::Base

  attr_accessible :title, :file, :user_id, :knowledge_element_id, :file_file_name, :file_content_type, :file_file_size

  validates :title, presence: true
  validates :user_id, presence: true
  validates :knowledge_element_id, presence: true

  has_attached_file :file,
                    :url  => "/assets/materials/documents/:id/:basename.:extension",
                    :path => ":rails_root/public/assets/materials/documents/:id/:basename.:extension"

  validates_attachment_presence :file
  validates_attachment_size :file, :less_than => 5.megabytes
  validates_attachment_content_type :file, :content_type =>
      # pdf
      ['application/pdf',
       # texts
       'text/plain', 'application/rtf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.oasis.opendocument.text',
       # spreadsheets
       'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.oasis.opendocument.spreadsheet',
       # presentations
       'application/vnd.ms-powerpoint', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/vnd.oasis.opendocument.presentation']
  #do_not_validate_attachment_file_type :file

  has_one :users
  has_one :knowledge_elements

end
