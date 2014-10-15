class RemoveExerciseIdFromComments < ActiveRecord::Migration
  def change
    remove_reference :comments, :exercise_id, index: true
  end
end
