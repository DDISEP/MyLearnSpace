class AddFileName < ActiveRecord::Migration
  def change
     add_column :data_files, :fileName, :string

  end
end
