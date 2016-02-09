class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :maxPoints
      t.integer :minPoints
      t.time :maxTime

      t.timestamps
    end
  end
end
