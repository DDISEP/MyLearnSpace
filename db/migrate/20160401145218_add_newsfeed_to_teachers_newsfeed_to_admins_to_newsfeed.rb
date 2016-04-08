class AddNewsfeedToTeachersNewsfeedToAdminsToNewsfeed < ActiveRecord::Migration
  def change
    add_column :newsfeeds, :newsfeedToTeachers, :boolean
    add_column :newsfeeds, :newsfeedToAdmins, :boolean
  end
end
