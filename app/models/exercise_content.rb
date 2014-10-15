class ExerciseContent < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :content
end
