class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.Integer :maxPoints
      t.Integer :minPoints

      t.timestamps :created_at
    end
  end
end
