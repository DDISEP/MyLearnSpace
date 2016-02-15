class CreateLearningObjectives < ActiveRecord::Migration
  def change
    create_table :learning_objectives do |t|
      t.integer :cognitiveDimension
      t.references :knowledge_elements, index: true


      t.timestamps
    end
  end
end
