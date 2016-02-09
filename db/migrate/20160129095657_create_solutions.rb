class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :solution
      t.string :description

      t.timestamps
    end
  end
end
