class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.String :title
      t.Int :hours
      t.String :descriptionOfContent

      t.timestamps
    end
  end
end
