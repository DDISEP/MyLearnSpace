class CreateMaterialdocuments < ActiveRecord::Migration
  def change
    create_table :materialdocuments do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
