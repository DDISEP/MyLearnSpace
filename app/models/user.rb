class User < ActiveRecord::Base

    attr_accessible :username, :email, :password, :pupil
    validate :valid_user
    #validates :username,      presence: {message: 'Gib bitte noch einen Benutzernamen an!'},
    #                          uniqueness: {message: 'Diesen Benutzernamen gibt es leider schon!'}
    #                          
    #validates :email,         presence: {message: 'Wir brauchen noch deine E-Mail Adresse!'},
    #                          uniqueness: {message: 'Diese E-Mail Adresse ist schon registriert!'}
    #                          
    #validates :password,      presence: {message: 'Es wurde kein Passwort eingegeben!'},
    #                          presence: {length: {in: 6..20}, message: 'Dein Passwort muss mindestens 6 und maximal 20 Zeichen umfassen!'}#,
                              # Abfrage: Passwor == Bestätitgung: presence: {:password == :confirmation, message: 'Das Passwort und die Passwortbestätigung stimmen nicht überein!'}

    #validates :confirmation,  presence: {message: 'Bitte bestätige noch dein Passwort!'}
    
    def valid_user
      if self.username.blank?
        #self.errors.add_to_base("Username leer")
      end
      return false
    end
   
    
end
