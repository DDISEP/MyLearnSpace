class CreateMateriallinks < ActiveRecord::Migration
  def change
    create_table :materiallinks do |t|
      t.string :title
      t.string :link
      t.integer :user_id

      t.timestamps
    end
  end
end
