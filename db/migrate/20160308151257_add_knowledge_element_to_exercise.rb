class AddKnowledgeElementToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :knowledge_element_id, :integer
  end
end
