class Materiallink < ActiveRecord::Base

  attr_accessible :title, :link, :user_id

  validates :title, presence: true
  validates :link, presence: true
  validates :user_id, presence: true

  has_one :users
  has_and_belongs_to_many :knowledge_elements

end
