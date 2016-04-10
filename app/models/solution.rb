class Solution < ActiveRecord::Base
  attr_accessible :solution, :description, :subexercise_id

  belongs_to :subexercise
end