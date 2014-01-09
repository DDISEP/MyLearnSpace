class User < ActiveRecord::Base
    include ActiveModel::Validations
    attr_accessible :username, :email, :password,  :pupil
    validate :valid_user, :on => :new
    validate :valid_login, :on => :login
    has_many :questions
    has_and_belongs_to_many :curriculums
    
    def valid_login
      errors.add(:base, "FEHLER")
      return errors.count == 0
    end
    
    
    def valid_user
      if username.blank?
        errors.add(:base, "Gib bitte noch einen Benutzernamen an!")
      end
      unless User.find_by_username(username).nil?
        errors.add(:base, "Den Benutzenamen gibt es leider schon!!")
      end
      if email.blank?
        errors.add(:base, "Wir brauchen noch deine E-Mail Adresse!")
      end
      if password.blank?
        errors.add(:base, "Es wurde kein Passwort eingegeben!")
      end
    
      errors.add(:base, "Dein Passwort muss mind. 6 und max. 20 Zeichen umfassen!") unless self.password.length.in?(6..20)
      
      #errors.add(:base, "Die Passwörter stimmen nicht überein!") unless confirmation != self.password
            
      return errors.count == 0
    end
    
    def self.search(search)
      if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      else
        find(:all)
    end
  end
   
    
end
