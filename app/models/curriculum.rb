class Curriculum < ActiveRecord::Base
   
   
  attr_accessible :country, :state, :profession, :level, :typeOfSchool, :subject, :hyperlink #WICHTIG für Formluar und create!!!
  
  
  #Validations
  validates_presence_of :subject, :message => " darf nicht leer sein."
  
  validates_presence_of :level, :message => " darf nicht leer sein."
  validates_inclusion_of :level, :in => 5..13, :message => " muss zwischen 5 und 13 liegen"
  
  validates_presence_of :typeOfSchool, :message => " darf nicht leer sein."
  
  validates_inclusion_of :profession, :in => %w(naturwissenschaftlich sprachlich klassisch musisch wirtschaftlich handwerklich).push(""), :message => "falsche Angabe"
  
  validates_presence_of :country, :message => " darf nicht leer sein."
  validates_inclusion_of :country, :in => %w(Deutschland Österreich Schweiz), :message => " muss Deutschland, Österreich oder Schweiz lauten."

  validates_presence_of :state, :message => " darf nicht leer sein."
  
  validates_presence_of :hyperlink, :message => " darf nicht leer sein"
  
  
  #Relations between different parts of the website
  #m:n relation between curriculum and learningUnit (join-table curriculums_learningUnits) with destroy-dependence
  has_many :learningUnits, :dependent => :destroy
  #m:n relation between curriculum and user (join-table knowledge_elements_learningUnits)
  has_and_belongs_to_many :users
  
end
