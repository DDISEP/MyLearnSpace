class solution < ActiveRecord::Base
  attr_accessible :solution, :description

  belongs_to :subexercise
end