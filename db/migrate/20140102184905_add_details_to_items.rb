class AddDetailsToItems < ActiveRecord::Migration
  def change
    add_reference :items, :curriculum, polymorphic: true, index: true
  end
end
