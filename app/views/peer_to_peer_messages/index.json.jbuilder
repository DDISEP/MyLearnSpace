json.array!(@peer_to_peer_messages) do |peer_to_peer_message|
  json.extract! peer_to_peer_message, :id, :sender, :reciever, :subject, :message
  json.url peer_to_peer_message_url(peer_to_peer_message, format: :json)
end
