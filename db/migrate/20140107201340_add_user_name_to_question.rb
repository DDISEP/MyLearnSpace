class AddUserNameToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :user_name, :string
  end
end
