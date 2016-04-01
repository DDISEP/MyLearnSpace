class Newsfeed < ActiveRecord::Base

  attr_accessible :subject, :message, :newsfeedToAll, :newsfeedToAdmins, :newsfeedToTeachers

end
