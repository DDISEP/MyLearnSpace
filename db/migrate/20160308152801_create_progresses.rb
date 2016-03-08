class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|

      t.timestamps
    end
  end
end
