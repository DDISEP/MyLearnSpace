class Subexercise < ActiveRecord::Base
  #attr_accessor :position,  :text , :solution, :exercise_id, :points, :moderated, :active, :examItem
  attr_accessible :position,  :text, :solution_id, :exercise_id, :points, :moderated, :active, :examItem, :cognitive_dimension, :users_id

  belongs_to :exercise
  has_one :solution
  belongs_to :learning_objective

  #Falls man das so macht funktioniert rake db:reset nicht mehr
  #def cognitive_dimension
   # return @learning_objective.cognitive_dimension
  #end

end
