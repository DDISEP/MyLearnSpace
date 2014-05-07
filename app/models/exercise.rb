class Exercise < ActiveRecord :: Base
  
  #exercises for learning on specific topic, later on to be connected with tags
  
  attr_accessible :date, :title, :description
  
  has_many :tags                #each exercise is useful for many tags
  has_many :exercise_questions  #exercise consists of many questions
  belongs_to :user              #each exercise is composed by one user
  
end