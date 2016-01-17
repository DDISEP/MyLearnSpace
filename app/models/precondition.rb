class Precondition < ActiveRecord::Base


  attr_accessible :necessity

  validates :necessity,
            presence: true,
            inclusion: 0..1

  #Relations between different parts of the website
  #n:2 relation between Precondition and Learning Objective
  has_many :learning_objectives

  validates :learning_objectives,
            length: {minimum: 2, maximum: 2}


end