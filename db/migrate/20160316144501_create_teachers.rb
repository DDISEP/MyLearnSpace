class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :lastName
      t.string :firstName

      t.timestamps
    end
  end
end
