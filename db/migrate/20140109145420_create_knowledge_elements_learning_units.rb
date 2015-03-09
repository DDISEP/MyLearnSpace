class CreateKnowledgeElementsLearningUnits < ActiveRecord::Migration
  def change
    create_table :knowledge_elements_learning_units do |t|
      t.belongs_to :knowledge_element
      t.belongs_to :learning_unit
    end
  end
end
