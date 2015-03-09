class ExerciseContent < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :knowledge_element
end
