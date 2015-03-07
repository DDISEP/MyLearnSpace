class CreateContentsLearningUnits < ActiveRecord::Migration
  def change
    create_table :contents_learning_units do |t|
      t.belongs_to :content
      t.belongs_to :learning_unit
    end
  end
end
