class Materialtext < ActiveRecord::Base

  attr_accessible :title, :text

  validates :title, presence: true
  validates :text, presence: true

end
