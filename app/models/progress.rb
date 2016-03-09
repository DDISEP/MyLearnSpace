class Progress < ActiveRecord::Base

  attr_accessible :learner_id, :teacher_id, :knowledge_element_id, :grade

  validates :learner_id, presence: true
  validates :knowledge_element_id, presence: true
  validates :grade, presence: true

  belongs_to :user
  belongs_to :knowledge_element

end
