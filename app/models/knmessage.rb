class Knmessage < ActiveRecord::Base
  attr_accessible :knowledge_element_id, :name, :content
  belongs_to :knowledge_element
end
