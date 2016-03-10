class CreateMaterialvideos < ActiveRecord::Migration
  def change
    create_table :materialvideos do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end

    create_join_table :knowledge_elements, :materialvideos
  end
end
