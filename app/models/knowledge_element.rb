class KnowledgeElement < ActiveRecord::Base
  
  #Wiki Tags (m:n ralation between wiki and knowledge_element with join-table wiki_tags)
  has_many :wiki_tags
  has_many :wikis, :through => :wiki_tags 
  has_and_belongs_to_many :exercises
  has_and_belongs_to_many :assessments
  #end 
 
  attr_accessible :tag
  
  validates_presence_of :tag, :message => " darf nicht leer sein."
  validates_uniqueness_of :tag, :message => " gibt es schon."
  
  
  #m:n relation between knowledge_elements and learning_units (join-table knowledge_elements_learningUnits)
  has_and_belongs_to_many :learningUnits

  
end
