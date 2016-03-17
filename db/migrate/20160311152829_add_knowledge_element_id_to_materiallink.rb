class AddKnowledgeElementIdToMateriallink < ActiveRecord::Migration
  def change
    add_column :materiallinks, :knowledge_element_id, :integer
  end
end
