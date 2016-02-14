class CreateKnowledgeElementChats < ActiveRecord::Migration
  def change
    create_table :knowledge_element_chats do |t|

      t.timestamps
    end
  end
end
