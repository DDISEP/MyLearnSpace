class Curriculum < ActiveRecord::Base
  
 # has_many :items
  
  validates_presence_of :subject, :message => " darf nicht leer sein."
  
  validates_presence_of :level, :message => " darf nicht leer sein."
  validates_inclusion_of :level, :in => 5..13, :message => " muss zwischen 5 und 13 liegen"
  
  validates_presence_of :typeOfSchool, :message => " darf nicht leer sein."
  
  validates_inclusion_of :profession, :in => %w(naturwissenschaftlich sprachlich klassisch musisch wirtschaftlich handwerklich), :message => "falsche Angabe"
  
  validates_presence_of :country, :message => " darf nicht leer sein."
  validates_inclusion_of :country, :in => %w(Deutschland Austria Schweiz), :message => " muss Deutschland, Austria oder Schweiz lauten."
  
  validates_presence_of :state, :message => " darf nicht leer sein."
  
  #validates :subject, :presence => true, :message => " Fach darf nicht leer sein"
  #validates :level, :presence => true, :inclusion => { :in => [5..13]}
  #validates :typeOfSchool, :presence => true #Liste der existierenden Schultypen fehlt
  #validates :profession, :inclusion => { :in => ["naturwissenschaftlich", "sprachlich", "klassisch", "musisch", "wirtschaftlich", "handwerklich"] }
  #validates :country, :presence => true, :inclusion => { :in => ["Deutschland", "Austria", "Schweiz"] }
  #alidates :state, :presence => true #Liste der BuLä dynamisch nach Auswahl Land geplant
end
