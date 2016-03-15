require 'digest/sha1'

#Encoding: utf-8
class User < ActiveRecord::Base
    
    include ActiveModel::Validations
    attr_accessible :username, :lastName, :firstName, :email, :birthday, :lastNameParent, :firstNameParent, :adressParent, :emailParent, :password, :pupil, :admin, :learner, :teacher
    validate :valid_user
    has_and_belongs_to_many :curriculums
    before_create :hash_password
    before_update :hash_password
    validates_uniqueness_of :username, :email
    has_many :comments, dependent: :nullify
    has_many :exercises, dependent: :nullify
    has_many :likes, dependent: :destroy
    has_many :performances, dependent: :destroy

    def hash_password
      self.password = Digest::MD5.hexdigest(self.password)
    end    
    
    def valid_user
      if username.blank?
        errors.add(:base, "Gib bitte noch einen Benutzernamen an!")
      end
      if firstName.blank?
      errors.add(:base, "Gib bitte deinen Vornamen an!")
      end
      if lastName.blank?
        errors.add(:base, "Gib bitte deinen Nachnamen an!")
      end
      if email.blank?
        errors.add(:base, "Wir brauchen noch deine E-Mail Adresse!")
      end
      if password.blank?
        errors.add(:base, "Es wurde kein Passwort eingegeben!")
      else 
        errors.add(:base, "Dein Passwort muss zwischen 12 und 20 Zeichen umfassen! Darunter müssen mindestens eine Zahl, ein Groß-, ein Kleinbuchstabe und ein Sonderzeichen enthalten sein.") unless valid_password
      end  
      return errors.count == 0
    end
  
    def self.authenticate email, password
        user = find_by_email email
        if user && user.password == password
            user
        else
            false
        end
    end

    def valid_password
        if self.password.length.in?(12..20)
            if self.password.include?("0") || self.password.include?("1") || self.password.include?("2") || self.password.include?("3") || self.password.include?("4") || self.password.include?("5") || self.password.include?("6") || self.password.include?("7") || self.password.include?("8") || self.password.include?("9")
                if self.password.include?("°") || self.password.include?("^") || self.password.include?("!") || self.password.include?("§") || self.password.include?("$") || self.password.include?("%") || self.password.include?("&") || self.password.include?("/") || self.password.include?("{") || self.password.include?("(") || self.password.include?("[") || self.password.include?(")") || self.password.include?("]") || self.password.include?("=") || self.password.include?("}") || self.password.include?("?") || self.password.include?("ß") || self.password.include?("´") || self.password.include?("`") || self.password.include?("@") || self.password.include?("€") || self.password.include?("+") || self.password.include?("*") || self.password.include?("~") || self.password.include?("#") || self.password.include?("'") || self.password.include?("<") || self.password.include?(">") || self.password.include?("|") || self.password.include?("µ") || self.password.include?(",") || self.password.include?(";") || self.password.include?(".") || self.password.include?(":") || self.password.include?("-") ||  self.password.include?("_")
                    if self.password.include?("A") || self.password.include?("B") || self.password.include?("C") || self.password.include?("D") || self.password.include?("E") || self.password.include?("F") || self.password.include?("G") || self.password.include?("H") || self.password.include?("I") || self.password.include?("J") || self.password.include?("K") || self.password.include?("L") || self.password.include?("M") || self.password.include?("N") || self.password.include?("O") || self.password.include?("P") || self.password.include?("Q") || self.password.include?("R") || self.password.include?("S") || self.password.include?("T") || self.password.include?("U") || self.password.include?("V") || self.password.include?("W") || self.password.include?("X") || self.password.include?("Y") || self.password.include?("Z") || self.password.include?("Ä") || self.password.include?("Ö") || self.password.include?("Ü")
                        if self.password.include?("a") || self.password.include?("b") || self.password.include?("c") || self.password.include?("d") || self.password.include?("e") || self.password.include?("f") || self.password.include?("g") || self.password.include?("h") || self.password.include?("i") || self.password.include?("j") || self.password.include?("k") || self.password.include?("l") || self.password.include?("m") ||  self.password.include?("n") || self.password.include?("o") || self.password.include?("p") || self.password.include?("q") || self.password.include?("r") || self.password.include?("s") || self.password.include?("t") || self.password.include?("u") || self.password.include?("v") || self.password.include?("w") || self.password.include?("x") || self.password.include?("y") || self.password.include?("z") || self.password.include?("ä") || self.password.include?("ö") || self.password.include?("ü") || self.password.include?("ß")
                            true
                        end
                    end
                end
            end
        end
    end
    
end
