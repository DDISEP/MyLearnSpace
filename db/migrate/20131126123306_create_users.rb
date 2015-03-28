class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.boolean :learner
      t.boolean :admin
      t.boolean :teacher

      t.timestamps
    end
  end
end
