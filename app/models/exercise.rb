class Exercise < ActiveRecord::Base
  
  has_many :tags 
  has_many :exercise_questions
  
  
  attr_accessible :tags, :title, :description, :exercise_questions
  
  validates_presence_of :title
  validates_uniqueness_of :title
  
end
