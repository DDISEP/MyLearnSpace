class CreateNewsfeeds < ActiveRecord::Migration
  def change
    create_table :newsfeeds do |t|
      t.String :subject
      t.String :message
      t.boolean :newsfeedToAll

      t.timestamps
    end
  end
end
