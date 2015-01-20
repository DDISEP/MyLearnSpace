class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :creation_date
      t.string :datetime
      t.string :title, limit: 255
      t.string :description, limit: 1000
      t.references :user, index: true
      t.references :task, index: true

      t.timestamps
    end
  end
end
