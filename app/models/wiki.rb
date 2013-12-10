class Wiki < ActiveRecord::Base
  validates :title, presence: true,
                    length: { in: 1..35 } ,
                    uniqueness: true
  validates :article, presence: true
  
def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['title LIKE ? OR article LIKE ?', search_condition, search_condition])
end

                      
end
