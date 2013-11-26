class UsersController < ApplicationController
  
  def index
    @users = User.all #hier muss jeweils noch authorisiert werden, wer sich das ausgeben lassen darf
  end
  
  def new
    @user = user.new
  end
  
  def create
    @user = User.create(params[:user]) #fehlt noch: Antwort, ob erfolgreich oder nicht (respond_with)
    @user=User.all
    render :action => :index
  end
  
  def show
  @user=User.find(params[:id])
  end
  
  def edit
    
  end 
  
  def update
    
  end
  
  def destroy
    u=User.find(params[:id])
    u.destroy
    @users = User.all
    render :action => :index
  end
  
  
end
