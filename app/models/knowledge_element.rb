class KnowledgeElement < ActiveRecord::Base
  attr_accessible :name, :description, :learning_objectives, :exams, :topic

  validates :name, presence: true
  validates :description, presence: true

  #Relations between different parts of the website
  #1:1 relation between KnowledgeElement and KnowledgeElement_Chat join table (?) with destroy dependence
  #has_one :knowledge_element_chat#, :dependent => :destroy
  #has_one :forum#, :dependent => :destroy

  has_one :progress

  #1:n relation between KnowledgeElement and LearningObjective with destroy dependence
  has_many :learning_objectives, :dependent => :destroy, inverse_of: :knowledge_element
  has_many :exams
  has_many :exercises

  #n:1 relation between KnowledgeElement and Topic
  belongs_to :topic
  
  #1:n relation between KnowledgeElement and Material
  has_many :materialtexts
  has_many :materiallinks
  has_many :materialdocuments
  has_many :materialpictures
  has_many :materialvideos

  #1:n relation between KnowledgeElement and Question
  has_many :questions

end
