class AddFileName < ActiveRecord::Migration
  def change
     add_column :data_files, :fileName, :string
     add_column :data_files, :fileType, :string

  end
end
