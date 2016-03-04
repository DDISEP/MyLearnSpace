class CreateMaterialpictures < ActiveRecord::Migration
  def change
    create_table :materialpictures do |t|
      t.string :title
      t.binary :file
      t.string :filename
      t.string :fileformat
      t.integer :user_id

      t.timestamps
    end

    create_join_table :knowledge_elements, :materialpictures
  end
end
