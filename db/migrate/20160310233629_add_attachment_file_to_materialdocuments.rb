class AddAttachmentFileToMaterialdocuments < ActiveRecord::Migration
  def self.up
    change_table :materialdocuments do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :materialdocuments, :file
  end
end
