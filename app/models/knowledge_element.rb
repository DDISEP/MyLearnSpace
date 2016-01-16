class KnowledgeElement < ActiveRecord

  attr_accessible :name, :description, :topic

  #Relations between different parts of the website
  #1:1 relation between KnowledgeElement and KnowledgeElement_Chat join table (?) with destroy dependence
  has_one :knowledgeElement_Chat, :dependent => :destroy

  #1:n relation between KnowledgeElement and LearningObjective with destroy dependence
  has_many :learningObjective, :dependent => :destroy

  #n:m relation between Knowledgeelement and Material
  has_and_belongs_to_many :linkedMaterial
end