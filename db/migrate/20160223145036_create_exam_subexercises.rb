class CreateExamSubexercises < ActiveRecord::Migration
  def change
    create_table :exam_subexercises do |t|

      t.timestamps
    end
  end
end
