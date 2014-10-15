class AddPointsToSubexercise < ActiveRecord::Migration
  def change
    add_column :subexercises, :points, :integer
  end
end
