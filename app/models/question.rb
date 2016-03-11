class Question < ActiveRecord::Base

  attr_protected
  
  validates :title, presence: true
  validates :text, presence: true
  validates :user_name, presence: true
  validates :knowledge_element_id, presence: true

  has_many :answers, dependent: :destroy
  has_one :users
  belongs_to :knowledge_element
end
