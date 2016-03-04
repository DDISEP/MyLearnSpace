class CreateMateriallinks < ActiveRecord::Migration
  def change
    create_table :materiallinks do |t|
      t.string :title
      t.string :link
      t.integer :user_id

      t.timestamps
    end

    create_join_table :knowledge_elements, :materiallinks
  end
end
