class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :title, limit: 40
      t.text :description

      t.timestamps
    end
  end
end
