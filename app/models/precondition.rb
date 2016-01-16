class Precondition < ActiveRecord::Base


  attr_accessible :necessity

  #Relations between different parts of the website
  #n:2 relation between Precondition and Learning Objective
  has_many :learning_objectives


end