require 'digest/sha1'

#Encoding: utf-8
class User < ActiveRecord::Base
  
    include ActiveModel::Validations
    attr_accessible :username, :email, :password,  :pupil
    validate :valid_user
    has_and_belongs_to_many :curriculums
    before_create :hash_password
    before_update :hash_password

    def hash_password
      self.password = Digest::MD5.hexdigest(self.password)
    end
    
    
    
    def valid_user
      if username.blank?
        errors.add(:base, "Gib bitte noch einen Benutzernamen an!")
      end
      
      if @current_user.nil?
         unless User.find_by_username(username).nil?
            errors.add(:base, "Den Benutzenamen gibt es leider schon!!")
         end
      else 
        if @current_user.username != username
          unless User.find_by_username(username).nil?
            errors.add(:base, "Den neuen Benutzenamen gibt es leider schon!!")
          end
        end
      end
      
      if email.blank?
        errors.add(:base, "Wir brauchen noch deine E-Mail Adresse!")
      end
      if password.blank?
        errors.add(:base, "Es wurde kein Passwort eingegeben!")
      else 
        errors.add(:base, "Dein Passwort muss mind. 6 und max. 20 Zeichen umfassen!") unless self.password.length.in?(6..20)
      end
      
      #errors.add(:base, "Die Passwörter stimmen nicht überein!") unless self.password_confirmation == self.password
            
      return errors.count == 0
    end
    
    def self.search(search)
      if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
    end
  
    def self.authenticate email, password
        user = find_by_email email
        if user && user.password == password
            user
        else
            false
        end
    end
    
end
