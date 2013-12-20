class RemoveCreationdateFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :creationdate, :date
  end
end
