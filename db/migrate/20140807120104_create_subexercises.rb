class CreateSubexercises < ActiveRecord::Migration
  def change
    create_table :subexercises do |t|
      t.integer :position
      t.string :text
      t.string :solution
      t.references :task, index: true

      t.timestamps
    end
  end
end
