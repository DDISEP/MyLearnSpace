class WikiTag < ActiveRecord::Base
  attr_accessible :wiki_id, :knowledge_element_id
  
  belongs_to :wiki
  belongs_to :knowledge_element
  
end
