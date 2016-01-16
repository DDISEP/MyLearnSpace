class Topic < ActiveRecord::Base

  attr_accessible :name, :description, :subject

  validates_presence_of :name, :message => " darf nicht leer sein."
  validates_presence_of :description, :message => " darf nicht leer sein."
  validates_presence_of :subject, :message => " darf nicht leer sein."

  #Relations between different parts of the website
  #n:m relation between Topic and KnowledgeElement
  has_and_belongs_to_many :knowledge_elements


end