class RemoveQuestionCounterFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :questionCounter, :integer
  end
end
