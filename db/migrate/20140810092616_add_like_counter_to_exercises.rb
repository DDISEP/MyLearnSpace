class AddLikeCounterToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :likeCounter, :integer
  end
end
