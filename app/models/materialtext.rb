class Materialtext < ActiveRecord::Base

  attr_accessible :title, :text, :user_id

  validates :title, presence: true
  validates :text, presence: true
  validates :user_id, presence: true

  has_many :users
  has_and_belongs_to_many :knowledge_elements

end
