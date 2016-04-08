class CreatePeerToPeerMessages < ActiveRecord::Migration
  def change
    create_table :peer_to_peer_messages do |t|
      t.integer :sender
      t.integer :reciever
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
