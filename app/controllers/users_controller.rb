#Encoding: utf-8
class UsersController < ApplicationController
  skip_before_action :check_login, only: [:new, :create]
  
  def index
    @users = User.all.sort{|a,b| a.username <=> b.username } #hier muss jeweils noch authorisiert werden, wer sich das ausgeben lassen darf
  end
  
  def new     
     @user = User.new
  end   
  
  def profile 
  end
  
  def create
       if params[:password] != params[:password_confirmation]
         flash.now[:notice] = 'Passwortbestaetigung falsch'
         redirect_to new_user_path 
       else      
         @user = User.new(params[:user])
          if @user.save
            redirect_to new_login_path, :notice => "Dein Profil wurde erfolgreich angelegt! Um alle Funktionen nutzen zu können, melde dich jetzt hier an."
          else
            render "new.html.erb"
          end
       end
  end
  
 
  def show #fremde profile
    #@user=User.find(params[:id]) #wenn username in session gleich gesuchtem username ,dann profile
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
     @user = @current_user
  end 

  def update
    @user = @current_user
    if @user.update_attributes params[:user]
         redirect_to user_profile_path
         #:notice => "Profil erfolgreich geändert"
    else
        render 'edit'
        #:notice =>  "Profil wurde nicht erfolgreich geändert. Bitte probier es nocheinmal"
    end
  end

  def destroy
    @user= @current_user
    @user.destroy
    session.clear
    redirect_to root_url    
    #if params[:password].nil?

    #else  
      #@password = Digest::MD5.hexdigest(params[:password])
      #if @password == @user.password
       #@user.destroy
        #redirect_to root_url
      #else
        #redirect_to users_destroy_path, :notice => "Falsches Passwort. Benutzerprofil wurde nicht gelöscht"
      #end
    #end
    
  end
  
end
