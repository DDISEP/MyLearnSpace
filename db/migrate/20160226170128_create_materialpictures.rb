class CreateMaterialpictures < ActiveRecord::Migration
  def change
    create_table :materialpictures do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
