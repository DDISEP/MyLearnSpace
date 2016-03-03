class Answer < ActiveRecord::Base

  belongs_to :question

  has_one :users


  attr_protected
  
  validates :text, presence: {message: "Du kannst keine leere Antwort angeben!"}, 
                  length: { minimum: 5, message: "Deine Antwort muss mindestens 5 Zeichen enthalten"}
  validates :question_id, presence: {message: :"Unexpected Error: no question associated!"}
end
