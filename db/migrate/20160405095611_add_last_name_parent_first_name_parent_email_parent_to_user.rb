class AddLastNameParentFirstNameParentEmailParentToUser < ActiveRecord::Migration
  def change
    add_column :users, :lastNameParent, :string
    add_column :users, :firstNameParent, :string
    add_column :users, :emailParent, :string
  end
end
