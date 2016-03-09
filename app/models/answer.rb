class Answer < ActiveRecord::Base

  attr_protected

  validates :text, presence: true
  validates :question_id, presence: true
  validates :user_id, presence: true

  belongs_to :question
  has_one :users
end
