class AddQuestionCounterToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :questionCounter, :integer
  end
end
