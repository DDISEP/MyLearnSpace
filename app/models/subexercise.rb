class Subexercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :assessment
end
