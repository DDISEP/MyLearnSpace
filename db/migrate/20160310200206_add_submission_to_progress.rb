class AddSubmissionToProgress < ActiveRecord::Migration
  def change
    add_column :progresses, :submission1, :text
    add_column :progresses, :submission2, :text
    add_column :progresses, :submission3, :text
  end
end
