class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :hours
      t.string :descriptionOfContent
      #t.belongs_to :curriculum

      t.timestamps
    end
  end
end
