class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :lastName
      t.string :firstName

      t.timestamps
    end
  end
end
