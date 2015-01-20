class CreateContentsItems < ActiveRecord::Migration
  def change
    create_table :contents_items do |t|
      t.belongs_to :content
      t.belongs_to :learning_units
    end
  end
end
