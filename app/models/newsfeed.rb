class Newsfeed < ActiveRecord::Base

  include ActiveModel::Validations
  attr_accessible :subject, :message, :newsfeedToAdmins, :newsfeedToTeachers, :newsfeedToAll
  validate :valid_newsfeed

  def valid_newsfeed
    if subject.blank?
      errors.add(:base, "Bitte gib einen Betreff an!")
    end
    if message.blank?
      errors.add(:base, "Deine Nachricht enthält keinen Inhalt. Bitte gib einen Inhalt an!")
    end
    if newsfeedToAll.blank?
      if newsfeedToTeachers.blank?
        if newsfeedToAdmins.blank?
          errors.add(:base, "Du hast keine Zielgruppe angegeben. Bitte gib an, wen diese Newsfeednachricht erreichen soll.")
        end
      end
    end
    self.newsfeedToAdmins = true if newsfeedToAll
    self.newsfeedToTeachers = true if newsfeedToAll
    self.newsfeedToAdmins = true if newsfeedToTeachers
    return errors.count == 0
  end





end
