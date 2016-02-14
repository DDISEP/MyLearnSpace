class Precondition < ActiveRecord::Base
  attr_accessible :necessity

  validates :necessity,
            presence: true,
            inclusion: 0..1

  #Relations between different parts of the website
  #Preconditions are the edges between two LearningObjectives
  belongs_to :learning_objective
  belongs_to :parent_learning_objetive, :class_name => "LearningObjective"

end
