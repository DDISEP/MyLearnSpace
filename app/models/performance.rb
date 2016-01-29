class Performance < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise
  belongs_to :teacher
end
