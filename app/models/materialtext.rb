class Materialtext < ActiveRecord::Base

  attr_accessible :title, :text, :user_id, :knowledge_element_id

  validates :title, presence: true
  validates :text, presence: true
  validates :user_id, presence: true
  validates :knowledge_element_id, presence: true

  has_one :users
  has_one :knowledge_elements

end
