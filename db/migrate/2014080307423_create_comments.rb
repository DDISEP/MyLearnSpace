class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :user, index: true
      t.references :exercise, index: true
      t.references :assessment, index: true

      t.timestamps
    end
  end
end
