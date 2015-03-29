class AddAttachmentImageToAssessments < ActiveRecord::Migration
  def self.up
    change_table :assessments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :assessments, :image
  end
end
