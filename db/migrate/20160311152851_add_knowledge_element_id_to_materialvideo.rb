class AddKnowledgeElementIdToMaterialvideo < ActiveRecord::Migration
  def change
    add_column :materialvideos, :knowledge_element_id, :integer
  end
end
