class AssociateExamToSubexercise < ActiveRecord::Migration
  def change
    create_table :exam_subexercise, id: false do |t|
      t.belongs_to :exams, index: true
      t.belongs_to :subexercises, index: true
    end
  end
end
