class Topic

  attr_accessible :name, :description, :subject

  #Relations between different parts of the website
  #n:m relation between Topic and KnowledgeElement
  has_and_belongs_to_many :knowledge_elements


end