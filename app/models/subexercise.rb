class Subexercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :solution
  belongs_to :learning_objective
end
