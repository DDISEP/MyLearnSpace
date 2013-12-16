class Curriculum < ActiveRecord::Base
  validates :subject, :presence => true
  validates :level, :presence => true, :inclusion => { :in => [5..13]}
  validates :typeOfSchool, :presence => true #Liste der existierenden Schultypen fehlt
  validates :profession, :inclusion => { :in => ["naturwissenschaftlich", "sprachlich", "klassisch", "musisch", "wirtschaftlich", "handwerklich"] }
  validates :country, :presence => true, :inclusion => { :in => ["Deutschland", "Austria", "Schweiz"] }
  validates :state, :presence => true #Liste der BuLä dynamisch nach Auswahl Land geplant
  has_many :items
end
