class Materialvideo < ActiveRecord::Base

  attr_accessible :title, :file, :filename, :fileformat, :user_id

  validates :title, presence: true
  validates :file, presence: true
  validates :user_id, presence: true

  has_one :users
  has_and_belongs_to_many :knowledge_elements

end
