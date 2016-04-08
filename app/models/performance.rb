class Performance < ActiveRecord::Base
  belongs_to :user

  belongs_to :subexercise
end
