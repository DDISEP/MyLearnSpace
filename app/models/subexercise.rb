class Subexercise < ActiveRecord::Base
  #attr_accessor :position,  :text , :solution, :exercise_id, :points, :moderated, :active, :examItem
  attr_accessible :position,  :text, :solution, :exercise_id, :points, :moderated, :active, :examItem, :cognitive_dimension

  belongs_to :exercise
  #belongs_to :solution
  belongs_to :learning_objective

  def cognitive_dimension
    return @learning_objective.cognitive_dimension
  end
end
