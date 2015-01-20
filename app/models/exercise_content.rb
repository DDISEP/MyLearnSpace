class ExerciseContent < ActiveRecord::Base
  belongs_to :task
  belongs_to :knowledge_element
end
