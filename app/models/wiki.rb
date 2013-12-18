class Wiki < ActiveRecord::Base
  
 
  validates :title, length: { in: 1..35 }
  validates :title, presence:  {message: "Bitte einen Titel eingeben"}
  validates :article, presence:  {message: "Ein leerer Artikel ist nicht sehr lehrreich!"}
  validates :title, uniqueness:  {message: 'Zu diesem Titel gibt es schon einen Artikel!'}
  
  
   
  attr_accessible :title, :article
  
  
  
def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR article LIKE ?', search_condition, search_condition])
end


end
