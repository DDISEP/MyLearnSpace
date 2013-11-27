class UsersController < ApplicationController
  
  def index
    @users = User.all #hier muss jeweils noch authorisiert werden, wer sich das ausgeben lassen darf
  end
  
  def new
    
  end
  
  def login
    render "login.html.erb"
  end
  
  def create
    @user = User.create(params[:user]) #fehlt noch: Antwort, ob erfolgreich oder nicht (respond_with)
    @user.save
    redirect_to @user
  end

private  
  def show
    @user=User.find(params[:id])
  end

private  
  def showByName 
    @user=User.find_by_name(params[:name])
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
  
  
end
