class CreateExerciseContents < ActiveRecord::Migration
  def change
    create_table :exercise_contents do |t|
      t.references :task, index: true
      t.references :knowledge_elements, index: true

      t.timestamps
    end
  end
end
