class AddUserNameToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :user_name, :string
  end
end
