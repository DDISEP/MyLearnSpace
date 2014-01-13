class CreateWikiTags < ActiveRecord::Migration
  def change
    create_table :wiki_tags do |t|
      t.integer :wiki_id
      t.integer :content_id

      t.timestamps
    end
  end
end
