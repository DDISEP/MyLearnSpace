class LearningUnit < ActiveRecord::Base
  
  attr_accessible :title, :hours, :descriptionOfKnowledgeElement, :curriculum_id
  
  #Validations
  validate :valid_learning_unit
  validates_uniqueness_of :title, :message => " gibt es schon."
  validates_exclusion_of :hours, :in => [0], :message => " darf nicht 0 sein"

  def valid_learning_unit
    if title.nil?
      errors.add(:base, "Geben Sie bitte noch einen Titel an.")
    end
    if descriptionOfKnowledgeElement.nil?
      errors.add(:base, "Geben Sie bitte noch eine Beschreibung des Lehrplaninhaltes an.")
    end
    if hours==0
      errors.add(:base, "Die Stundenanzahl darf nicht 0 sein.")
    end
    return errors.count == 0
  end

  #Relations between different parts of the website
  #1:n relation between curriculum and learningUnit
  belongs_to :curriculum
  #m:n relation between learningUnit and knowledge_element (join-table knowledge_elements_learningUnits)
  has_and_belongs_to_many :knowledge_elements

end
