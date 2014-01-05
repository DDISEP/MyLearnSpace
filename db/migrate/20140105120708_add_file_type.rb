class AddFileType < ActiveRecord::Migration
  def change
    add_column :data_files, :fileType, :string
  end
end
