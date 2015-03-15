class CreateSubassessments < ActiveRecord::Migration
  def change
    create_table :subassessments do |t|
      t.integer :position
      t.string :text
      t.string :solution
      t.integer :points
      t.references :assessment, index: true
      t.timestamps
    end
  end
end
