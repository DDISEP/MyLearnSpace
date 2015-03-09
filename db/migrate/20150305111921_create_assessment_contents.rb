class CreateAssessmentContents < ActiveRecord::Migration
  def change
    create_table :assessment_contents do |t|
      t.references :assessment, index: true
      t.references :knowledge_element, index: true

      t.timestamps
    end
  end
end
