class CreateLearningUnits < ActiveRecord::Migration
  def change
    create_table :learning_units do |t|
      t.string :title
      t.integer :hours
      t.string :descriptionOfKnowledgeElement
      t.belongs_to :curriculum
      t.timestamps
    end
  end
end
