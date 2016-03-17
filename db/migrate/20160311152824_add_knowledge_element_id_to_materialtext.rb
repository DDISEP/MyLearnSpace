class AddKnowledgeElementIdToMaterialtext < ActiveRecord::Migration
  def change
    add_column :materialtexts, :knowledge_element_id, :integer
  end
end
