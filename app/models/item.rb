class Item < ActiveRecord::Base
  validates :title, presence => true
  validates :hours, :inclusion => { :in => [0..40]}
  validates :descriptionOfContent, :presence => true
  belongs_to :curriculum 
end
