class Question < ActiveRecord::Base
  belongs_to :user
  
  attr_protected 
end
