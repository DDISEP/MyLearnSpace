class Wiki < ActiveRecord::Base
  
 
  
  validates :title, presence: {message: "Bitte einen Titel eingeben"}
  validates :article, presence:  {message: "Ein leerer Artikel ist nicht sehr lehrreich!"}
  validates :title, uniqueness:  {message: 'Zu diesem Titel gibt es schon einen Artikel!'}
  validates :title, length: { in: 1..35 } #TODO
  
  
   
  attr_accessible :title, :article
  
  
  
def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR article LIKE ?', search_condition, search_condition])
end

def self.searchSuggestions(search)
  search_condition = search +"%"
  find(:all, :conditions => ['title LIKE ?', search_condition]) #TODO: Einschränkung auf top 10 
  
end

end
