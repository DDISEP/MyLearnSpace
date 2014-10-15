class RemoveLikeCounterFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :likeCounter, :integer
  end
end
