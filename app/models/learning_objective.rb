class LearningObjective < ActiveRecord::Base
  #nicht in unserer Rails version
  #enum cognitiveDimension: [:remember, :understand, :apply, :analyze,:evaluate, :create]
  attr_accessible :cognitiveDimension, :preconditions, :curriculums

  #Relations between different parts of the website
  #n:m relation between LearningObjective and Curriculum
  has_and_belongs_to_many :curriculums

  #self-referential relation between different LearningObjectives in the map through preconditions
  # 1:m relation between LearningObjective and Precondition with destroy dependency
  has_many :parent_learning_objective_preconditions, foreign_key: :child_learning_objective_id, class_name: "Precondition"
  has_many :parent_learning_objectives, through :parent_learning_objectives_preconditions, source: :parent_learning_objective
  has_many :child_learning_objective_preconditions, foreign_key: :parent_learning_objective_id, class_name: "Precondition"
  has_many :child_learning_objectives, through :child_learning_objectives_preconditions, source: :child_learning_objective

  #has_many :preconditions, :dependent => :destroy
  #has_many :parent_learning_objectives, through: :preconditions#, source => :learningObjective#,  class_name => "LearningObjective"
  #has_many :inverse_preconditions, :class_name => "Precondition", :foreign_key => "learning_objectives_id", :dependent => destroy
  #has_many :child_learning_objectives, :through => :inverse_preconditions, :source => :learningObjective, class_name => "LearningObjective"

  #1:n relation between LearningObjective and KnowledgeElement
  belongs_to :knowledge_element, inverse_of: :learning_objectives #required: true, ging nicht muss nachschauen wieso

  has_many :items
end
