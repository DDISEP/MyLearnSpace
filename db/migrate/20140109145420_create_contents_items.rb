class CreateContentsItems < ActiveRecord::Migration
  def change
    create_table :contents_items do |t|
      t.belongs_to :content
      t.belongs_to :item
    end
  end
end
