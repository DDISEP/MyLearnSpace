class CreateNewsfeeds < ActiveRecord::Migration
  def change
    create_table :newsfeeds do |t|
      t.string :subject
      t.string :message
      t.boolean :newsfeedToAll

      t.timestamps
    end
  end
end
