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
        if self.password.include?("0"||"1"||"2"||"3"||"4"||"5"||"6"||"7"||"8"||"9")
          if self.password.include?("°"||"^"||"!"||"§"||"$"||"%"||"&"||"/"||"{"||"("||"["||")"||"]"||"="||"}"||"?"||"ß"||"´"||"`"||"@"||"€"||"+"||"*"||"~"||"#"||"'"||"<"||">"||"|"||"µ"||","||";"||"."||":"||"-"||"_")
            if self.password.include?("A"||"B"||"C"||"D"||"E"||"F"||"G"||"H"||"I"||"J"||"K"||"L"||"M"||"N"||"O"||"P"||"Q"||"R"||"S"||"T"||"U"||"V"||"W"||"X"||"Y"||"Z"||"Ä"||"Ö"||"Ü")
              if self.password.include?("a"||"b"||"c"||"d"||"e"||"f"||"g"||"h"||"i"||"j"||"k"||"l"||"m"||"n"||"o"||"p"||"q"||"r"||"s"||"t"||"u"||"v"||"w"||"x"||"y"||"z"||"ä"||"ö"||"ü"||"ß")
              end
            end
          end
        end
      end
    end
    
end
