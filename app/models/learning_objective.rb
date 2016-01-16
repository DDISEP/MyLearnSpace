class LearningObjective < ActiveRecord

  attr_accessible cognitiveDimension,

  #Relations between different parts of the website
  #n:m relation between LearningObjective and Curriculum
  has_and_belongs_to_many :curricula
  has_and_belongs_to_many :task

  #n:m relation between LearningObjective and Precondition with destroy dependency
  has_many :preconditions, :dependent => :destroy

  #1:1 relation between LearningObjective and KnowledgeElement
  belongs_to :knowledge_element

end