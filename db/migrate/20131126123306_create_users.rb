class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      t.column :username, :string
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.boolean :pupil

      t.timestamps
    end
  end
end
