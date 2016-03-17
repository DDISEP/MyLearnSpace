class AddSubexerciseToProgress < ActiveRecord::Migration
  def change
    add_column :progresses, :subexercise1_id, :integer
    add_column :progresses, :subexercise2_id, :integer
    add_column :progresses, :subexercise3_id, :integer
  end
end
