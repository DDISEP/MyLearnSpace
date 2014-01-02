class CreateCurriculumsUsers < ActiveRecord::Migration
  def change
    create_table :curriculums_users do |t|
      t.belongs_to :curriculum 
      t.belongs_to :user
    end
  end
end
