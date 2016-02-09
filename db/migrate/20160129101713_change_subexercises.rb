class ChangeSubexercises < ActiveRecord::Migration
  def change
    add_column :subexercises, :moderated, :boolean
    add_column :subexercises, :active, :boolean
    add_column :subexercises, :examItem, :boolean
    remove_column :subexercises, :solutions, :String
  end
end
