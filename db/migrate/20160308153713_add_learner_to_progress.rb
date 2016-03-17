class AddLearnerToProgress < ActiveRecord::Migration
  def change
    add_column :progresses, :learner_id, :integer
  end
end
