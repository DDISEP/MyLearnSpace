class Newsfeed < ActiveRecord::Base

  attr_accessible :subject, :message, :newsfeedToAdmins, :newsfeedToTeachers, :newsfeedToAll





end
