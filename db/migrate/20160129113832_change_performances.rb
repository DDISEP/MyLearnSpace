class ChangePerformances < ActiveRecord::Migration
  def change
    remove_column :performances, :max_points
    remove_column :performances, :current_position
    add_column    :performances, :handedin, :string
  end
end
