class Question < ActiveRecord::Base

  attr_protected
  
  validates :title, presence: true
  validates :text, presence: true

  has_many :answers
  has_one :users
end
