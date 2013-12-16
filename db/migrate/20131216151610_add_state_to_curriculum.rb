class AddStateToCurriculum < ActiveRecord::Migration
  def change
    add_column :curriculums, :state, :string
  end
end
