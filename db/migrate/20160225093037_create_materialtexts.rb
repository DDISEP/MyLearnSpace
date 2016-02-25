class CreateMaterialtexts < ActiveRecord::Migration
  def change
    create_table :materialtexts do |t|
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
