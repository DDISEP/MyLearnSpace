class AddConnectionSubexerciseSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :subexercise_id, :integer
    remove_column :subexercises, :solution
    add_column :subexercises, :solution_id, :integer
  end
end
