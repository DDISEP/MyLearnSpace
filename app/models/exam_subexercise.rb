class ExamSubexercise < ActiveRecord::Base
  belongs_to :exam
  belongs_to :subexercise
end
