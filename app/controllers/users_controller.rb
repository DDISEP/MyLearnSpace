#Encoding: utf-8
class UsersController < ApplicationController
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
    @user = User.new(params[:user])
    if @user.save
      redirect_to new_login_path, :notice => "Hier sind wir gelandet!"#"Dein Profil wurde erfolgreich angelegt! Um alle Funktionen nutzen zu können, melde dich jetzt hier an."
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

  def createadmin
     @newuser = User.new(params[:user])
    if @newuser.save
      redirect_to user_path, :notice => "Herzlichen Glückwunsch. Du hast erfolgreich einen neuen Admin erstellt!"#"Dein Profil wurde erfolgreich angelegt! Um alle Funktionen nutzen zu können, melde dich jetzt hier an."
    else
      render "createadmin.html.erb"
    end
  end


  def destroy
    @user= @current_user
    @user.destroy
    session.clear
    redirect_to root_url   
  end

  
end
