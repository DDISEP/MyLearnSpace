class AddAttachmentImageToExercises < ActiveRecord::Migration
  def self.up
    change_table :exercises do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :exercises, :image
  end
end
