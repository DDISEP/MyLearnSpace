class PeerToPeer < ActiveRecord::Base

  attr_accessible :sender, :reciever, :subject, :message

end
