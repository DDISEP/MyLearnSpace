class Topic < ActiveRecord::Base
  attr_accessible :name, :description, :subject

  #enum subject: [:Mathematik, :Deutsch, :Englisch, :Ethik, :Französisch, :Informatik, :Physik, :Chemie, :Biologie, :Geschichte, :Sozialkunde, :Latein, :Wirtschaft_und_Recht, :Kunst, :Musik, :Sport, :Katholische_Religionslehre, :Evangelische_Religionslehre]

  validates :name, presence: true
  validates :description, presence: true
  validates :subject, presence: true

  #Relations between different parts of the website
  #1:n relation between Topic and KnowledgeElement
  has_many :knowledge_elements
end
