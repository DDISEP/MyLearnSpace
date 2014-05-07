class TestAnswer < ActiveRecord::Base
  
  belongs_to :test_question
  
  attr_accessible :explanation
  
end