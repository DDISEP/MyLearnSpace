class Precondition < ActiveRecord::Base


  attr_accessible :necessity



  #Relations between different parts of the website
  #n:2 relation between Precondition and Learning Objective
  has_many :learning_objectives

  validates :learning_objectives, length: {minimum: 2}
  validates :learning_objectives, length: {maximum: 2}


end