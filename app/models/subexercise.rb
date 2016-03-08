class Subexercise < ActiveRecord::Base
  #attr_accessor :position,  :text , :solution, :exercise_id, :points, :moderated, :active, :examItem
  attr_accessible :position,  :text, :solution, :exercise_id, :points, :moderated, :active, :examItem, :learning_objective_id

  belongs_to :exercise
  #belongs_to :solution
  belongs_to :learning_objective

  def cognitive_dimension
    return @(LearningObjective.where(learning_objective_id: :learning_objective_id)).cognitive_dimension
  end
end
