class CreateJoinMateriallinksKnowledgeElements < ActiveRecord::Migration
  def change
    create_table :join_materiallinks_knowledge_elements do |t|
      t.integer :materiallink_id
      t.integer :knowledge_element_id
    end
  end
end
