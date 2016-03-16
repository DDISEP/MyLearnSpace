class CreateLearners < ActiveRecord::Migration
  def change
    create_table :learners do |t|
      t.string :firstName
      t.string :lastName
      t.date :birthday
      t.string :lastNameParent
      t.string :firstNameParent
      t.string :adressParent
      t.string :emailParent

      t.timestamps
    end
  end
end
