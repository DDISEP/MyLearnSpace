class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :creation_date
      t.string :datetime
      t.string :title, limit: 255
      t.string :description, limit: 1000
      t.references :user, index: true
      t.references :assessment, index: true
      t.timestamps
    end
  end
end
