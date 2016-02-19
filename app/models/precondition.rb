class Precondition < ActiveRecord::Base
  attr_accessible :necessity

  validates :necessity,
            presence: true,
            inclusion: 0..1

  #Relations between different parts of the website
  #Preconditions are the edges between two LearningObjectives
  belongs_to :child_learning_objective, foreign_key: "child_learning_objective_id", class_name: "LearningObjective"
  belongs_to :parent_learning_objetive, foreign_key: "parent_learning_objective_id", :class_name => "LearningObjective"

end
