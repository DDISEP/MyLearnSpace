class CreateContentsItems < ActiveRecord::Migration
  def change
    create_table :contents_items do |t|
      t.belongs_to :knowledge_elements
      t.belongs_to :learning_units
    end
  end
end
