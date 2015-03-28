class AddAttachmentAvatarToAssessments < ActiveRecord::Migration
  def self.up
    change_table :assessments do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :assessments, :avatar
  end
end
