#Encoding: utf-8
class UsersController < ApplicationController
  helper_method :current_user, :logged_in_as_admin?, :logged_in_as_teacher?
  skip_before_action :check_login, only: [:new, :create]

  
  def index
    @users = User.all.sort{|a,b| a.username.downcase <=> b.username.downcase } #Sortierung nach Alphabet um Suche zu ersetzem
  end
  
  def new     
     @user = User.new
  end   
  
  def profile
    if @current_user.nil?
      redirect_to users_path
    end 
  end
  
  def create
    @newUser = User.new(params[:user])
    if @newUser.save
      redirect_to users_path, :notice => "Hier sind wir gelandet!"#"Dein Profil wurde erfolgreich angelegt! Um alle Funktionen nutzen zu können, melde dich jetzt hier an."
    else
      render "new.html.erb"
    end
  end


  def show 
    
  end

  
  def edit
      @user = @current_user
      #Passwortfeld bleibt in der Anzeige zunächst leer und muss vom Benutzer nochmal ausgefüllt werden
      flash.now[:notice] = 'Bitte gib zur Speicherung der geänderten Daten erneut dein Passwort ein. Falls du dein Passwort ändern möchtest, dann gib dein neues Passwort ein.'
  end 

  def update
  @user = User.find(params[:id])
  
  respond_to do |format|
    if @user.update(params[:user])
      format.html { redirect_to users_profile_path, notice: 'Das Benutzerprofil wurde erfolgreich geändert.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
  end

  def add_new_user

  end

  def current_user
    @current_user ||= User.find_by_id(session[:user])
  end

  def logged_in_as_admin?
    current_user != nil and current_user.admin?
  end

  def logged_in_as_teacher?
    current_user != nil and current_user.teacher?
  end
  def newAdmin

  end

  def destroy
    @user= @current_user
    @user.destroy
    session.clear
    redirect_to root_url   
  end

  
end
