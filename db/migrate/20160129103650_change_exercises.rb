class ChangeExercises < ActiveRecord::Migration
  def change
    add_column   :exercises, :moderated, :boolean
    add_column   :exercises, :sequence, :boolean
  end
end
