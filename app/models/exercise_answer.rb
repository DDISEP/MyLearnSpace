class ExerciseAnswer < ActiveRecord::Base
  
  #answers to te questions of the exercises
  
  belongs_to :exercise_question
  
  attr_accessible :explanation
  
end