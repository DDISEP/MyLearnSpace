class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :description
      t.string :subject

      t.timestamps
    end

    create_join_table :knowledge_elements, :topics
  end
end
