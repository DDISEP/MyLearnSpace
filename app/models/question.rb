class Question < ActiveRecord::Base

  attr_protected
  
  validates :title, presence: true
  validates :text, presence: true

  has_many :answers, dependent: :destroy
  has_one :users
end
