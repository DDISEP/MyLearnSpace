class User < ActiveRecord::Base
    include ActiveModel::Validations
    attr_accessible :username, :email, :password,  :pupil
    validate :valid_user
    
    #validates :username, uniqueness: {message: 'Diesen Benutzernamen gibt es leider schon!'}
               
   
    #validates :email, uniqueness: {message: 'Diese E-Mail Adresse ist schon registriert!'}
                       
                                  
    # Abfrage: Passwort == Bestätigung: presence: {:password == :confirmation, message: 'Das Passwort und die Passwortbestätigung stimmen nicht überein!'}
    #validates :confirmation,  presence: {message: 'Bitte bestätige noch dein Passwort!'}
    
    def valid_user
      if self.username.blank?
        errors.add(:base, "Gib bitte noch einen Benutzernamen an!")
      end
      if self.username
        errors.add(:base, "Den Benutzenamen gibt es leider schon!!")
      end
      if self.email.blank?
        errors.add(:base, "Wir brauchen noch deine E-Mail Adresse!")
      end
      if self.password.blank?
        errors.add(:base, "Es wurde kein Passwort eingegeben!")
      end

      errors.add(:base, "Dein Passwort muss mind. 6 und max. 20 Zeichen umfassen!") unless self.password.in?(6..20)
            

      return false
    end
   
    
end
