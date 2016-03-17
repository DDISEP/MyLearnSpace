class FixLearningObjectiveToSubexerciseName < ActiveRecord::Migration
  def change
    rename_column :subexercises, :learning_objective_id, :cognitive_dimension
  end
end
