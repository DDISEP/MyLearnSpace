class AddGradeToProgress < ActiveRecord::Migration
  def change
    add_column :progresses, :grade, :integer
  end
end
