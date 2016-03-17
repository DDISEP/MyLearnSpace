class CreateKnowledgeElements < ActiveRecord::Migration
  def change
    create_table :knowledge_elements do |t|
      t.string :name
      t.text :description
      t.belongs_to :topic

      t.timestamps
    end

    #not necessary (vier Jointabellen mit jeweils materialtext, -link, etc.)
    #create_join_table :knowledge_elements, :materials
  end
end
