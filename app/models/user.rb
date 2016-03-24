require 'digest/sha1'

#Encoding: utf-8
class User < ActiveRecord::Base
    
    include ActiveModel::Validations
    attr_accessible :username, :email, :password,  :pupil, :admin, :learner, :teacher
    validate :valid_user
    has_and_belongs_to_many :curriculums # mit Gruppe Zach Ellermeier abklären
    before_create :hash_password
    before_update :hash_password
    validates_uniqueness_of :username, :email
    has_many :comments, dependent: :nullify # mit Gruppe Hafemann Sticha absprechen
    has_many :exercises, dependent: :nullify # mit Gruppe Ottinger Grett absprechen
    has_many :likes, dependent: :destroy # mit Grupee Hafemann Sticha absprechen
    has_many :performances, dependent: :destroy # mit Gruppe Ottinger Grett absprechen
    #has_many :messages

    #n:1 to materialXs
    has_many :materialtexts
    has_many :materiallinks
    has_many :materialdocuments
    has_many :materialpictures
    has_many :materialvideos

    has_many :questions
    has_many :answers

    def hash_password
      self.password = Digest::MD5.hexdigest(self.password)
    end    
    
    def valid_user
      if username.blank?
        errors.add(:base, "Gib bitte noch einen Benutzernamen an!")
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

    #def valid_password
    # if self.password.length.in?(12..20)
    #  if self.password.include?("0") || self.password.include?("1") || self.password.include?("2") || self.password.include?("3") || self.password.include?("4") || self.password.include?("5") || self.password.include?("6") || self.password.include?("7") || self.password.include?("8") || self.password.include?("9")
    #   if self.password.include?("°") || self.password.include?("^") || self.password.include?("!") || self.password.include?("§") || self.password.include?("$") || self.password.include?("%") || self.password.include?("&") || self.password.include?("/") || self.password.include?("{") || self.password.include?("(") || self.password.include?("[") || self.password.include?(")") || self.password.include?("]") || self.password.include?("=") || self.password.include?("}") || self.password.include?("?") || self.password.include?("ß") || self.password.include?("´") || self.password.include?("`") || self.password.include?("@") || self.password.include?("€") || self.password.include?("+") || self.password.include?("*") || self.password.include?("~") || self.password.include?("#") || self.password.include?("'") || self.password.include?("<") || self.password.include?(">") || self.password.include?("|") || self.password.include?("µ") || self.password.include?(",") || self.password.include?(";") || self.password.include?(".") || self.password.include?(":") || self.password.include?("-") ||  self.password.include?("_")
    #    if self.password.include?("A") || self.password.include?("B") || self.password.include?("C") || self.password.include?("D") || self.password.include?("E") || self.password.include?("F") || self.password.include?("G") || self.password.include?("H") || self.password.include?("I") || self.password.include?("J") || self.password.include?("K") || self.password.include?("L") || self.password.include?("M") || self.password.include?("N") || self.password.include?("O") || self.password.include?("P") || self.password.include?("Q") || self.password.include?("R") || self.password.include?("S") || self.password.include?("T") || self.password.include?("U") || self.password.include?("V") || self.password.include?("W") || self.password.include?("X") || self.password.include?("Y") || self.password.include?("Z") || self.password.include?("Ä") || self.password.include?("Ö") || self.password.include?("Ü")
    #     if self.password.include?("a") || self.password.include?("b") || self.password.include?("c") || self.password.include?("d") || self.password.include?("e") || self.password.include?("f") || self.password.include?("g") || self.password.include?("h") || self.password.include?("i") || self.password.include?("j") || self.password.include?("k") || self.password.include?("l") || self.password.include?("m") ||  self.password.include?("n") || self.password.include?("o") || self.password.include?("p") || self.password.include?("q") || self.password.include?("r") || self.password.include?("s") || self.password.include?("t") || self.password.include?("u") || self.password.include?("v") || self.password.include?("w") || self.password.include?("x") || self.password.include?("y") || self.password.include?("z") || self.password.include?("ä") || self.password.include?("ö") || self.password.include?("ü") || self.password.include?("ß")
    #      true
    #     end
    #    end
    #   end
    #  end
    # end
    #end

    #Überprüfung auf geeignetes Passwort
    def valid_password
      i=0
      a=0
      #Überprüfung auf korrekte Länge
      if self.password.length.in?(12..20)
        #überprüft ob Ziffern enthalten sind
        if self.password.include?("0") || self.password.include?("1") || self.password.include?("2") || self.password.include?("3") || self.password.include?("4") || self.password.include?("5") || self.password.include?("6") || self.password.include?("7") || self.password.include?("8") || self.password.include?("9")
          #überprüft ob Großbuchstaben enthalten sind
          if self.password.include?("A") || self.password.include?("B") || self.password.include?("C") || self.password.include?("D") || self.password.include?("E") || self.password.include?("F") || self.password.include?("G") || self.password.include?("H") || self.password.include?("I") || self.password.include?("J") || self.password.include?("K") || self.password.include?("L") || self.password.include?("M") || self.password.include?("N") || self.password.include?("O") || self.password.include?("P") || self.password.include?("Q") || self.password.include?("R") || self.password.include?("S") || self.password.include?("T") || self.password.include?("U") || self.password.include?("V") || self.password.include?("W") || self.password.include?("X") || self.password.include?("Y") || self.password.include?("Z") || self.password.include?("Ä") || self.password.include?("Ö") || self.password.include?("Ü")
            #überprüft ob Kleinbuchstaben enthalten sind
            if self.password.include?("a") || self.password.include?("b") || self.password.include?("c") || self.password.include?("d") || self.password.include?("e") || self.password.include?("f") || self.password.include?("g") || self.password.include?("h") || self.password.include?("i") || self.password.include?("j") || self.password.include?("k") || self.password.include?("l") || self.password.include?("m") ||  self.password.include?("n") || self.password.include?("o") || self.password.include?("p") || self.password.include?("q") || self.password.include?("r") || self.password.include?("s") || self.password.include?("t") || self.password.include?("u") || self.password.include?("v") || self.password.include?("w") || self.password.include?("x") || self.password.include?("y") || self.password.include?("z") || self.password.include?("ä") || self.password.include?("ö") || self.password.include?("ü") || self.password.include?("ß")
              #überprüfung auf Sonderzeichen
              while i < self.password.length
                if self.password.chars.fetch(i).eql? ('1') or self.password.chars.fetch(i).eql? ('2') or self.password.chars.fetch(i).eql? '3' or self.password.chars.fetch(i).eql? '4' or self.password.chars.fetch(i).eql? '5' or self.password.chars.fetch(i).eql? '6' or self.password.chars.fetch(i).eql? '7' or self.password.chars.fetch(i).eql? '8' or self.password.chars.fetch(i).eql? '9' or self.password.chars.fetch(i).eql? '0'
                a = a+1
                i = i+1
                elsif self.password.chars.fetch(i).eql? 'A' or self.password.chars.fetch(i).eql? 'B' or self.password.chars.fetch(i).eql? 'C' or self.password.chars.fetch(i).eql? 'D' or self.password.chars.fetch(i).eql? 'E' or self.password.chars.fetch(i).eql? 'F' or self.password.chars.fetch(i).eql? 'G' or self.password.chars.fetch(i).eql? 'H' or self.password.chars.fetch(i).eql? 'I' or self.password.chars.fetch(i).eql? 'J' or self.password.chars.fetch(i).eql? 'K' or self.password.chars.fetch(i).eql? 'L' or self.password.chars.fetch(i).eql? 'M' or self.password.chars.fetch(i).eql? 'N' or self.password.chars.fetch(i).eql? 'O' or self.password.chars.fetch(i).eql? 'P' or self.password.chars.fetch(i).eql? 'Q' or self.password.chars.fetch(i).eql? 'R' or self.password.chars.fetch(i).eql? 'S' or self.password.chars.fetch(i).eql? 'T' or self.password.chars.fetch(i).eql? 'U' or self.password.chars.fetch(i).eql? 'V' or self.password.chars.fetch(i).eql? 'W' or self.password.chars.fetch(i).eql? 'X' or self.password.chars.fetch(i).eql? 'Y' or self.password.chars.fetch(i).eql? 'Z' or self.password.chars.fetch(i).eql? 'Ä' or self.password.chars.fetch(i).eql? 'Ö' or self.password.chars.fetch(i).eql? 'Ü'
                a = a+1
                i = i+1
                elsif self.password.chars.fetch(i).eql? 'a' or self.password.chars.fetch(i).eql? 'b' or self.password.chars.fetch(i).eql? 'c' or self.password.chars.fetch(i).eql? 'd' or self.password.chars.fetch(i).eql? 'e' or self.password.chars.fetch(i).eql? 'f' or self.password.chars.fetch(i).eql? 'g' or self.password.chars.fetch(i).eql? 'h' or self.password.chars.fetch(i).eql? 'i' or self.password.chars.fetch(i).eql? 'j' or self.password.chars.fetch(i).eql? 'k' or self.password.chars.fetch(i).eql? 'l' or self.password.chars.fetch(i).eql? 'm' or self.password.chars.fetch(i).eql? 'n' or self.password.chars.fetch(i).eql? 'o' or self.password.chars.fetch(i).eql? 'p' or self.password.chars.fetch(i).eql? 'q' or self.password.chars.fetch(i).eql? 'r' or self.password.chars.fetch(i).eql? 's' or self.password.chars.fetch(i).eql? 't' or self.password.chars.fetch(i).eql? 'u' or self.password.chars.fetch(i).eql? 'v' or self.password.chars.fetch(i).eql? 'w' or self.password.chars.fetch(i).eql? 'x' or self.password.chars.fetch(i).eql? 'y' or self.password.chars.fetch(i).eql? 'z' or self.password.chars.fetch(i).eql? 'ä' or self.password.chars.fetch(i).eql? 'ö' or self.password.chars.fetch(i).eql? 'ü'
                a = a+1
                i = i+1
                else
                  a = a+10
                  i = i+1
                end
              end
              if a > 20
                true
              end
            end
          end
        end
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
