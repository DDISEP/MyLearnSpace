class CreatePreconditions < ActiveRecord::Migration
  def change
    create_table :preconditions do |t|
      t.boolean :necessity
      t.integer :learning_objective_id
      t.integer :parent_learnining_objetive_id

      t.timestamps
    end

  end
end
