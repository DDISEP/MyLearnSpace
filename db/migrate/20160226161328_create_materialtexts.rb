class CreateMaterialtexts < ActiveRecord::Migration
  def change
    create_table :materialtexts do |t|
      t.string :title
      t.text :text
      t.integer :user_id

      t.timestamps
    end

    create_join_table :knowledge_elements, :materialtexts
  end
end
