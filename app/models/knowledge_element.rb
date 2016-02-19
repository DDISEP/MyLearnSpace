class KnowledgeElement < ActiveRecord::Base
  attr_accessible :name, :description, :learning_objectives

  validates :name, presence: true
  validates :description, presence: true

  #Relations between different parts of the website
  #1:1 relation between KnowledgeElement and KnowledgeElement_Chat join table (?) with destroy dependence
  has_one :knowledge_element_chat, :dependent => :destroy
  has_one :forum, :dependent => :destroy

  #1:n relation between KnowledgeElement and LearningObjective with destroy dependence
  has_many :learning_objectives, :dependent => :destroy, inverse_of: :knowledge_element
  has_many :exams

  #n:m relation between KnowledgeElement and Material
  has_and_belongs_to_many :materials
  has_and_belongs_to_many :topic

end
