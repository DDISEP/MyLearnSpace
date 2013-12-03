class UsersController < ApplicationController
  
  def index
    @users = User.all #hier muss jeweils noch authorisiert werden, wer sich das ausgeben lassen darf
  end
  
  def new
    @user = User.new
  end
  
  def login
    @fehler1 = false
    @fehler2 = false
    if params[:name] != nil
      if User.find_by_username(params[:name]) == nil
        @fehler1 = true
      elsif User.find_by_username(params[:name]).password == params[:pass]
        session[:name]=params[:name]
        redirect_to(:action => 'profile')
      else
        @fehler2 = true
      end
    end
  end
  
  def profile
    if params[:logout] != nil
      session[:name] = nil
      redirect_to(:action => 'login')
    end
    
    @fehler = false
    if session[:name] == nil
      @fehler = true
    else
      @session = session[:name]
    end
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
