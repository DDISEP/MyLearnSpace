class User < ActiveRecord::Base

    #attr_accessible :username, :email, :password, :pupil, :password_confirmation
    
    validates :username, presence: true,#name=>username???
                    uniqueness: true
    validates :email, presence: true,
                    uniqueness:true
    validates :password, presence: true
    
   
    
end
