class AddTeacherToProgress < ActiveRecord::Migration
  def change
    add_column :progresses, :teacher_id, :integer
  end
end
