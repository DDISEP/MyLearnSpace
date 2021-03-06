class Wiki < ActiveRecord::Base
  
 has_many :wiki_tags
 has_many :contents, :through => :wiki_tags
 
  
  validates :title, presence: {message: "Bitte einen Titel eingeben"}
  validates :article, presence:  {message: "Ein leerer Artikel ist nicht sehr lehrreich!"}
  validates :title, uniqueness:  {message: 'Zu diesem Titel gibt es schon einen Artikel!'}
  validates :title, length: { maximum: 35, message: "Titel darf max 35 Zeichen lang sein!"  } 
  
  
  
   
  attr_accessible :title, :article
 
def searchArticleForTags
  @tags = Content.all
  @tags_as_string = ""
  @tags.each do |tag|
    tagInArticle = Wiki.where("id = :w_id AND article LIKE :tag", {:w_id => id, :tag => "%#{tag.tag}%"})
    if !tagInArticle.empty?
      # contents << tag
      @tags_as_string += tag.tag 
      @tags_as_string += ","
     
    end
  end
  return @tags_as_string
end

def self.find_by_tags(content_ids, search_text) # wenn search_text leer ist wird nur nach Tags gesucht
  @articles = []
  search_condition = "%"+search_text+ "%"
  Wiki.all.each do |article|
    hasAllTags = true
    content_ids.each do |content|
      hasAllTags = article.contents.where("content_id = ?", content).any? and hasAllTags 
    end   
    if Wiki.where("id = ? and (title LIKE ? or article LIKE ?)", article.id, search_condition, search_condition).any? and hasAllTags
      @articles << article
    end
  end
    
  return @articles
end
  
def self.find_by_title(title)
  find(:all, :conditions => ["title LIKE ?", title])[0]   # liefert Array zurück -> deswegen [0] (Title ist unique)
end  
  
def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR article LIKE ?', search_condition, search_condition], :order => "clicks DESC", :limit => "15")
end

def self.searchSuggestions(search)
  search_condition = "%"+search +"%"
  find(:all, :conditions => ['title LIKE ?', search_condition], :order => "clicks DESC", :limit => "8")  
  
end
def setTags(paramsTags)
  tags = paramsTags.split(',')
  
  #alle löschen (zum überschreiben nötig)

 contents.delete_all 
  
  tags.each do |tag|
    c = Content.find_by_tag(tag.strip) #strip nötig zum entfernen von Whitespaces am Anfang
    if !c.nil?  and !contents.exists?(c.id)
       contents << c   
    else
       errors.add(:tag, '"'+tag+'" existiert nicht in der Contents-Datenbank!')        
    end     
  end
end
    
  
 

end
