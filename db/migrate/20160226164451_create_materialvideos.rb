class CreateMaterialvideos < ActiveRecord::Migration
  def change
    create_table :materialvideos do |t|
      t.string :title
      t.binary :file
      t.integer :user_id

      t.timestamps
    end
  end
end
