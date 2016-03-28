json.array!(@peer_to_peers) do |peer_to_peer|
  json.extract! peer_to_peer, :id, :subject, :message, :user_id
  json.url peer_to_peer_url(peer_to_peer, format: :json)
end
