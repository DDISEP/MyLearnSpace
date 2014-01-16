class Wiki < ActiveRecord::Base
  
 has_many :wiki_tags
 has_many :contents, :through => :wiki_tags
 
  
  validates :title, presence: {message: "Bitte einen Titel eingeben"}
  validates :article, presence:  {message: "Ein leerer Artikel ist nicht sehr lehrreich!"}
  validates :title, uniqueness:  {message: 'Zu diesem Titel gibt es schon einen Artikel!'}
  validates :title, length: { maximum: 35, message: "Titel darf max 35 Zeichen lang sein!"  } 
  
  #TODO clicks mit 0 initialisieren
  
   
  attr_accessible :title, :article
  
def self.find_by_title(title)
  find(:all, :conditions => ["title LIKE ?", title])[0]   # liefert Array zurück -> deswegen [0] (Title ist unique)
end  
  
def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR article LIKE ?', search_condition, search_condition], :order => "clicks DESC", :limit => "15")
end

def self.searchSuggestions(search)
  search_condition = search +"%"
  find(:all, :conditions => ['title LIKE ?', search_condition], :order => "clicks DESC", :limit => "8")  
  
end
def addTags(paramsTags)
  tags = paramsTags.split(',')
  
  #alle löschen (zum überschreiben nötig)

 
 contents.clear # wird nur foreign key gelöscht?

  
    
  tags.each do |tag|
    c = Content.find_by_tag(tag.strip) #strip nötig zum entfernen von Whitespaces am Anfang
    if !c.nil?  #and !contents.exists?(content.id)
       contents << c
     
       
    end     
  end
end
    
  
 

end
