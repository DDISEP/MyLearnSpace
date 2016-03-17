class Exam < ActiveRecord::Base
  attr_accessor :maxPoints, :minPoints, :maxTime, :created_at
  attr_accessible :maxPoints, :minPoints, :maxTime

  belongs_to :knowledgeElement
  has_many :performances
  has_and_belongs_to_many :learners
  has_many :examSubexercises
  has_and_belongs_to_many :subexercises

end
