class PeerToPeerMessage < ActiveRecord::Base
  attr_accessible :sender, :reciever, :subject, :message, :id

  def valid_peer_to_peer_message
    if subject.blank?
      errors.add(:base, "Bitte gib einen Betreff an!")
    end
    if message.blank?
      errors.add(:base, "Deine Nachricht enthält keinen Inhalt. Bitte gib einen Inhalt an!")
    end
    if sender.blank?
      errors.add(:base, "Du kanns keine anonymen Nachrichten verschicken. ;)")
    end
    if reciever.blank?
      errors.add(:base, "Du hast keinen Empfänger angegeben. Wenn die Nachricht nur für dich bestimmt ist, dann schicke sie einfach an dich selbst! ;)")
    else
      errors.add(:base, "Dein Passwort muss zwischen 12 und 20 Zeichen umfassen! Darunter müssen mindestens eine Zahl, ein Groß-, ein Kleinbuchstabe und ein Sonderzeichen enthalten sein.") unless valid_password
    end
    return errors.count == 0
  end

  def valid_reciever

  end

end
