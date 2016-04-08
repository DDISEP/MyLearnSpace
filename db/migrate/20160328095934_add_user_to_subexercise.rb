class AddUserToSubexercise < ActiveRecord::Migration
  def change
    add_reference :subexercises, :users
  end
end
