class CreateExerciseAnswers < ActiveRecord::Migration
  def change
    create_table :exercise_answers do |t|
      t.text :answer
      t.text :explanation

      t.timestamps
    end
  end
end
