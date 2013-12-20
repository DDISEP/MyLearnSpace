class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :text
      t.date :creationdate

      t.timestamps
    end
  end
end
