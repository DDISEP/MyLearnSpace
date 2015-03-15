class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :creation_date
      t.string :datetime
      t.string :title, limit: 255
      t.string :description, limit: 1000
      t.integer :min_points_1
      t.integer :min_points_2
      t.integer :min_points_3
      t.integer :min_points_4
      t.integer :min_points_5
      t.references :user, index: true
      t.references :assessment, index: true
      t.timestamps
    end
  end
end
