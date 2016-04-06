class ChangePerformance < ActiveRecord::Migration
  def change
    remove_column :performances, :exercise_id
    remove_reference :performances, :exercise
    add_column :performances, :subexercise_id, :integer
    #add_reference :performances, :subexercise
  end
end
