class Subexercise < ActiveRecord::Base
  attr_accessor :position,  :text , :solution, :exercise_id, :points, :moderated, :aktiv, :examItem
  attr_accessible :position,  :text , :solution, :exercise_id, :points, :moderated, :aktiv, :examItem

  belongs_to :exercise
  belongs_to :solution
  belongs_to :learning_objective
end
