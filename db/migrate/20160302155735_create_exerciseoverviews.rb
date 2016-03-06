class CreateExerciseoverviews < ActiveRecord::Migration
  def change
    create_table :exerciseoverviews do |t|

      t.timestamps
    end
  end
end
