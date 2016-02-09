class RenameExerciseToTask < ActiveRecord::Migration
  def change
    #rename_table :exercises, :tasks
    add_column   :tasks, :moderated, :boolean
    add_column   :tasks, :sequence, :boolean
  end
end
