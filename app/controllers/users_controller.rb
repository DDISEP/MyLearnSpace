#Encoding: utf-8
class UsersController < ApplicationController
  
  
  def index
    @users = User.all #hier muss jeweils noch authorisiert werden, wer sich das ausgeben lassen darf
  end
  
  def new     
     @user = User.new
  end   
  
  def profile #nur zugriff möglich, wenn schon eigens profil
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
       if params[:password] != params[:password_confirmation]
         flash.now[:notice] = 'Passwortbestaetigung falsch'
         redirect_to new_user_path 
       else      
         @user = User.new(params[:user])
         if @user.save
         redirect_to root_url, :notice => "Erfolgreich angemeldet!"
        else
         render "new.html.erb"
        end
       end
  end
  
 
  def show #fremde profile
    #@user=User.find(params[:id]) #wenn username in session gleich gesuchtemusername ,dann profile
  end

  def showByName 
    @user=User.find_by_username(params[:username])
    if @user.nil?
      render "showEmptyUser.html.erb"
    else
      render "show.html.erb"
    end
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
  
  def search
    @users = User.search params[:search]
    render "search_results" 
  end
  

end
