class CreateKnmessages < ActiveRecord::Migration
  def change
    create_table :knmessages do |t|
      t.integer :knowledge_element_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
