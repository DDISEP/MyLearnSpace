class Content < ActiveRecord::Base
  
  #Wiki Tags (m:n ralation between wiki and content with join-table wiki_tags)
  has_many :wiki_tags
  has_many :wikis, :through => :wiki_tags 
  has_and_belongs_to_many :exercises
  has_and_belongs_to_many :assessments
  #end 
 
  attr_accessible :tag
  
  validates_presence_of :tag, :message => " darf nicht leer sein."
  validates_uniqueness_of :tag, :message => " gibt es schon."
  
  
  #m:n relation between contents and items (join-table contents_items)
  has_and_belongs_to_many :items

  
end
