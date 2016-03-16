class Learner < ActiveRecord::Base
  attr_accessible :lastName, :firstName, :birthday, :lastNameParent, :firstNameParent, :emailParent, :adressParent
end
