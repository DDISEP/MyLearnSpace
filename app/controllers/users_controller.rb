class UsersController < ApplicationController
  
  def index
    @users = User.all #hier muss jeweils noch authorisiert werden, wer sich das ausgeben lassen darf
  end
  
  def new
    @user = User.new
  end
  
  def login
    render "login.html.erb"
  end
  
  def create
     @user = User.new(params[:user])
       if @user.save
         redirect_to root_url, :notice => "Erfolgreich angemeldet!"
       else
         render "new"
       end
  end

private  
  def show
    @user=User.find(params[:id])
  end

private  
  def showByName 
    @user=User.find_by_name(params[:username])
    if @user.nil?
      render "showEmptyUser.html.erb"
    else
      render "show.html.erb"
    end
  end
private  
  def edit
    
  end 

private  
  def update
    
  end

private  
  def destroy
    u=User.find(params[:id])
    u.destroy
    @users = User.all
    render :action => :index
  end

  def authenticate 
     user = User.find_by_email(params[:email])
     if user && user.authenticate(params[:password])
    end 
  end
  
end
