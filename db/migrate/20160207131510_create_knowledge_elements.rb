class CreateKnowledgeElements < ActiveRecord::Migration
  def change
    create_table :knowledge_elements do |t|
      t.string :name
      t.text :description
      t.topic :id

      t.timestamps
    end

    create_join_table :knowledge_elements, :materials
  end
end
