class CreateExerciseContents < ActiveRecord::Migration
  def change
    create_table :exercise_contents do |t|
      t.references :exercise, index: true
      t.references :knowledge_element, index: true

      t.timestamps
    end
  end
end
