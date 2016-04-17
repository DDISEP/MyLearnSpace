class CreatePreconditions < ActiveRecord::Migration
  def change
    create_table :preconditions do |t|
      t.boolean :necessity
      t.belongs_to :learning_objective
      t.belongs_to :parent_learning_objective

      t.timestamps
    end
  end
end
