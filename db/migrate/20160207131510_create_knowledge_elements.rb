class CreateKnowledgeElements < ActiveRecord::Migration
  def change
    create_table :knowledge_elements do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_join_table :knowledge_elements, :materials
  end
end
