class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :hours
      t.string :descriptionOfContent

      t.timestamps
    end
  end
end
