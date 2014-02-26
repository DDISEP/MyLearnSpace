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

  
  def create
    @password = Digest::MD5.hexdigest(params[:password])
    user = User.authenticate params[:email],@password
    if user
      session[:current_user_id] = user.id
      redirect_to users_profile_path
    else
      flash[:notice] = "Es ist ein Fehler aufgetreten. Bitte überprüfe nochmal deine Eingabedaten."
      render 'new'
    end
 end   


  def update
    respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to @login, notice: 'Login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    session.clear
    #flash[:notice] = "Erfolgreich abgemeldet!"
    redirect_to root_url
  end

end
