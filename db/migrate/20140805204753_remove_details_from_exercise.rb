class RemoveDetailsFromExercise < ActiveRecord::Migration
  def change
    remove_column :exercises, :creation_date, :string
    remove_column :exercises, :datetime, :string
    remove_column :exercises, :exercise_id, :string
  end
end
