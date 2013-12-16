class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.string :subject
      t.integer :level
      t.string :typeOfSchool
      t.string :profession

      t.timestamps
    end
  end
end
