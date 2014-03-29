class Item < ActiveRecord::Base
  
  attr_accessible :title, :hours, :descriptionOfContent, :curriculum_id
  
  #Validations
  validates_presence_of :title, :message => " darf nicht leer sein."
  validates_uniqueness_of :title, :message => " gibt es schon."
  
  validates_presence_of :descriptionOfContent, :message => " darf nicht leer sein."
  validates_exclusion_of :hours, :in => [0], :message => " darf nicht 0 sein"
  
  
  #Relations between different parts of the website
  #1:n relation between curriculum and item 
  belongs_to :curriculum
  #m:n relation between item and content (join-table contents_items) 
  has_and_belongs_to_many :contents

end
