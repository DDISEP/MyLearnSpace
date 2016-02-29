class CreateJoinMaterialtextsKnowledgeElements < ActiveRecord::Migration
  def change
    create_table :join_materialtexts_knowledge_elements do |t|
      t.integer :materialtext_id
      t.integer :knowledge_element_id
    end
  end
end
