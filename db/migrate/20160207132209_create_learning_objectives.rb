class CreateLearningObjectives < ActiveRecord::Migration
  def change
    create_table :learning_objectives do |t|
      t.integer :cognitiveDimension
      t.belongs_to :knowledge_element, index: true


      t.timestamps
    end
  end
end
