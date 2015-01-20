class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  
  def username
    if self.user == nil then
      return "Unbekannter Nutzer"
    else
      return user.username
    end
  end
end
