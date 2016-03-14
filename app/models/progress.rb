class Progress < ActiveRecord::Base

  attr_accessible :learner_id, :teacher_id, :knowledge_element_id, :grade, :submission1,:submission2,:submission3, :subexercise1_id, :subexercise2_id, :subexercise3_id

  validates :learner_id, presence: true
  validates :knowledge_element_id, presence: true
  validates :grade, :inclusion => 1..6, allow_blank: true
  

  belongs_to :user
  belongs_to :knowledge_element

end
