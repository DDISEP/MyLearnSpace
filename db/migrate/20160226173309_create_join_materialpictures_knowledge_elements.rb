class CreateJoinMaterialpicturesKnowledgeElements < ActiveRecord::Migration
  def change
    create_table :join_materialpictures_knowledge_elements do |t|
      t.integer :materialpicture_id
      t.integer :knowledge_element_id
    end
  end
end
