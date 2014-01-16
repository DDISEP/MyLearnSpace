class Content < ActiveRecord::Base
  
 #Wiki Tags
 has_many :wiki_tags
 has_many :wikis, :through => :wiki_tags 
 #end 
 
 
  attr_accessible :tag
  
  validates_presence_of :tag, :message => " darf nicht leer sein."
  validates_uniqueness_of :tag, :message => " gibt es schon."
  validates_uniqueness_of :tag, :message => "den Tag gibt es schon"
  
  has_and_belongs_to_many :items
end
