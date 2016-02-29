class Performance < ActiveRecord::Base
  belongs_to :learner
  belongs_to :exam
  belongs_to :teacher
end
