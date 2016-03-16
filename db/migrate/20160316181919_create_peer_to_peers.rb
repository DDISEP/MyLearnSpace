class CreatePeerToPeers < ActiveRecord::Migration
  def change
    create_table :peer_to_peers do |t|
      t.User :sender
      t.Array :receiver
      t.String :subject
      t.String :message

      t.timestamps
    end
  end
end
