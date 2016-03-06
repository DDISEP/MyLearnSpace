class Subexercise < ActiveRecord::Base
  #attr_accessor :position,  :text , :solution, :exercise_id, :points, :moderated, :active, :examItem
  attr_accessible :position,  :text, :solution, :exercise_id, :points, :moderated, :active, :examItem, :learning_objective_id

  belongs_to :exercise
  #belongs_to :solution
  belongs_to :learning_objective
end
