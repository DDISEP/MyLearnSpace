class LearningObjective < ActiveRecord::Base
  enum cognitiveDimension: [:remember, :understand, :apply, :analyze,:evaluate, :create]

  #Relations between different parts of the website
  #n:m relation between LearningObjective and Curriculum
  has_and_belongs_to_many :curriculums

  #self-referential relation between different LearningObjectives in the map through preconditions
  # 1:m relation between LearningObjective and Precondition with destroy dependency
  has_many :preconditions, :dependent => :destroy
  has_many :parent_learning_objectives, through: :preconditions, source => :learningObjective, class_name => "LearningObjective"
  has_many :inverse_preconditions, :class_name => "Precondition", :foreign_key => "learning_objectives_id", :dependent => destroy
  has_many :child_learning_objectives, :through => :inverse_preconditions, :source => :learningObjective, class_name => "LearningObjective"

  #1:n relation between LearningObjective and KnowledgeElement
  belongs_to :knowledge_element
  has_many :items

end
