#Encoding: utf-8
class Question < ActiveRecord::Base
  has_many :answers
  
  attr_protected
  
  validates :title, presence: {message: "Gib bitte eine kurzen Überschrift zu deiner Frage an!"}
  validates :text, presence: {message: "Hier musst du deine ausformulierte Frage angeben!"}
end
