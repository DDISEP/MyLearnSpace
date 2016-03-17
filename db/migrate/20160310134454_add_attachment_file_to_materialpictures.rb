class AddAttachmentFileToMaterialpictures < ActiveRecord::Migration
  def self.up
    change_table :materialpictures do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :materialpictures, :file
  end
end
