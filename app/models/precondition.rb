class Precondition < ActiveRecord::Base
  attr_accessible :necessity

  validates :necessity,
            presence: true

  #Relations between different parts of the website
  #Preconditions are the edges between two LearningObjectives
  belongs_to :learning_objective, class_name: "LearningObjective"
  validates :learning_objective,
            presence: true

  # belongs_to :child_learning_objective, foreign_key: "child_learning_objective_id", class_name: "LearningObjective"
  belongs_to :parent_learning_objective, foreign_key: "parent_learning_objective_id", :class_name => "LearningObjective"
  validates :parent_learning_objective,
      presence: true

end
