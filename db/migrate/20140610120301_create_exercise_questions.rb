class CreateExerciseQuestions < ActiveRecord::Migration
  def change
    create_table :exercise_questions do |t|
      t.text :question
      t.text :hint

      t.timestamps
    end
  end
end
