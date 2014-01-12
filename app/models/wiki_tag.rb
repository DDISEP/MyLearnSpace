class WikiTag < ActiveRecord::Base
  attr_accessible :wiki_id, :content_id
  
  belongs_to :wiki
  belongs_to :content 
  
end
