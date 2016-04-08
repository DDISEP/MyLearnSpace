class AddExplanationToProgress < ActiveRecord::Migration
  def change
    add_column :progresses, :explanation, :text
  end
end
