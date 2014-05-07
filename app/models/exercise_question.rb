class ExerciseQuestion < ActiveRecord::Base
	
	#parts of exercises, possibly with multiple ways of answering
	
	has_many :exercise_answers
	
  attr_accessible :question_text
  
end
