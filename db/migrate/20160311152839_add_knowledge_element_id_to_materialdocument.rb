class AddKnowledgeElementIdToMaterialdocument < ActiveRecord::Migration
  def change
    add_column :materialdocuments, :knowledge_element_id, :integer
  end
end
