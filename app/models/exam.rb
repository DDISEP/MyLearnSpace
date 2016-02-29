class Exam < ActiveRecord::Base

  attr_accessor :maxPoints, :minPoints, :maxTime, :created_at
  attr_accessible :maxPoints, :minPoints, :maxTime

  belongs_to :knowledgeElement
  has_many :performances
  has_many :learners, trough performances
  has_many :examSubexercises
  has_many :subexercises, trough examSubxercises


end
