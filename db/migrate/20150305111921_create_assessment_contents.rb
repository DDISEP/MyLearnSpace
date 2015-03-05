class CreateAssessmentContents < ActiveRecord::Migration
  def change
    create_table :assessment_contents do |t|
      t.references :assessment, index: true
      t.references :content, index: true

      t.timestamps
    end
  end
end
