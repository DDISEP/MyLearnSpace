class AddKnowledgeElementIdToMaterialpicture < ActiveRecord::Migration
  def change
    add_column :materialpictures, :knowledge_element_id, :integer
  end
end
