class Performance < ActiveRecord::Base
  attr_accessible :achieved_points, :user_id, :handedin, :subexercise_id

  belongs_to :user

  belongs_to :subexercise
end
