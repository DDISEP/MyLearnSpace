#Encoding: utf-8
class LoginsController < ApplicationController

  skip_before_action :check_login, only: [:new,:create]


  def index
    @logins = Login.all
  end

  def show
  end

  def new
    @login = Login.new
  end


  def edit
  end

  #Anmeldemethode => current_user wird angelegt
  def create
    @password = Digest::MD5.hexdigest(params[:password]) #Passwort wird gehasht
    user = User.authenticate params[:email],@password
    if user
      session[:current_user_id] = user.id
      redirect_to users_profile_path
    else
      flash[:notice] = "Es ist ein Fehler aufgetreten. Bitte überprüfe nochmal deine Eingabedaten."
      render 'new'
    end
 end   

  #Vorlage für update, wird aber von uns nicht benutzte(automatisch generiert vom Programm)
  def update
    respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to @login, notice: 'Login wurde erfolgreich aktualisiert.' }
        format.json { head :no_knowledge_element }
      else
        format.html { render action: 'edit' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  #Abmeldemethode
  def destroy
    session.clear
    redirect_to root_url
  end

end
