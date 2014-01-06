class Item < ActiveRecord::Base
  
  attr_accessible :title, :hours, :descriptionOfContent
  
  validates_presence_of :title, :message => " darf nicht leer sein."
  validates_presence_of :descriptionOfContent, :message => " darf nicht leer sein."
  validates_exclusion_of :hours, :in => [0], :message => " darf nicht 0 sein"
  
  belongs_to :curriculum
  has_many :items
end
