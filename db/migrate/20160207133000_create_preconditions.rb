class CreatePreconditions < ActiveRecord::Migration
  def change
    create_table :preconditions do |t|
      t.boolean :necessity
      t.belongs_to :child_learning_objective#, foreign_key: "child_learning_objective_id", class_name: "LearningObjective"#, index: true
      t.belongs_to :parent_learning_objective#, foreign_key: "parent_learning_objective_id", class_name: "LearningObjective"#, index: true

      t.timestamps
    end

    #create_join_table :learning_objectives, :parent_learning_objectives do |t|
    #end

    #create_table :parent_learning_objective_id

  end
end
