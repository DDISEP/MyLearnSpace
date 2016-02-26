class CreateJoinMaterialvideosKnowledgeElements < ActiveRecord::Migration
  def change
    create_table :join_materialvideos_knowledge_elements do |t|
      t.integer :materialvideo_id
      t.integer :knowledge_element_id
    end
  end
end
