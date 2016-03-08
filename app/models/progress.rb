class Progress < ActiveRecord::Base

  attr_accessible :learner_id, :teacher_id, :knowledge_element_id, :grade


  belongs_to :user
  belongs_to :knowledge_element

end
