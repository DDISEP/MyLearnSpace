class Materiallink < ActiveRecord::Base

  attr_accessible :title, :link, :user_id

  validates :title, presence: true
  validates :link, presence: true
  validates :user_id, presence: true
  validates :knowledge_element_id, presence: true

  has_one :users
  has_one :knowledge_elements

end
