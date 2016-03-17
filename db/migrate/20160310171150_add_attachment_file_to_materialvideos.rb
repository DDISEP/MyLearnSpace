class AddAttachmentFileToMaterialvideos < ActiveRecord::Migration
  def self.up
    change_table :materialvideos do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :materialvideos, :file
  end
end
