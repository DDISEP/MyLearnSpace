class CreateKnowledgeElements < ActiveRecord::Migration
  def change
    create_table :knowledge_elements do |t|
      t.string :tag
      t.text :content

      t.timestamps
    end
  end
end
