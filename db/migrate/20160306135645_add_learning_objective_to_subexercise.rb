class AddLearningObjectiveToSubexercise < ActiveRecord::Migration
  def change
    add_column :subexercises, :learning_objective_id, :integer
  end
end
