class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :max_points
      t.integer :achieved_points
      t.references :user, index: true
      t.references :task, index: true

      t.timestamps
    end
  end
end
