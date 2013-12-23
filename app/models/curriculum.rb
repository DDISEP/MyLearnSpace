class Curriculum < ActiveRecord::Base
   
  attr_accessible :country, :state, :profession, :level, :typeOfSchool, :subject #WICHTIG für Formluar und create!!!
  
  validates_presence_of :subject, :message => " darf nicht leer sein."
  
  validates_presence_of :level, :message => " darf nicht leer sein."
  validates_inclusion_of :level, :in => 5..13, :message => " muss zwischen 5 und 13 liegen"
  
  validates_presence_of :typeOfSchool, :message => " darf nicht leer sein."
  
  validates_inclusion_of :profession, :in => %w(naturwissenschaftlich sprachlich klassisch musisch wirtschaftlich handwerklich).push(""), :message => "falsche Angabe"
  
  validates_presence_of :country, :message => " darf nicht leer sein."
  validates_inclusion_of :country, :in => %w(Deutschland Austria Schweiz), :message => " muss Deutschland, Austria oder Schweiz lauten."
  
  validates_presence_of :state, :message => " darf nicht leer sein."
  
  has_many :items
  
end
