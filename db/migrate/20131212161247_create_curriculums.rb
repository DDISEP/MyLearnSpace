class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.String :subject
      t.Int :level
      t.String :typeOfSchool
      t.String :profession

      t.timestamps
    end
  end
end
