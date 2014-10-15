class AddCurrentPositionToPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :current_position, :integer
  end
end
