class Content < ActiveRecord::Base
  
  attr_accessible :tag
  
  validates_presence_of :tag, :message => " darf nicht leer sein."
  
  has_and_belongs_to_many :items
end
