
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery
  before_action :check_login
  
  #check-login sichert die Zugriffsrechte und verhindert Zugriffe von außen
  def check_login
    unless session[:current_user_id].nil?#Ein Benutzer ist eingeloggt
      @current_user = User.find(session[:current_user_id]) 
    else
      if  session[:admin].nil? #Kein Administrator ist eingeloggt => Keiner ist eingeloggt
        redirect_to root_url, :notice =>"Du musst dich dazu erst anmelden!"
      else #Ein Administrator ist eingeloggt
         @admin = session[:admin] 
      end
    end
  end

  def authorize_admin
    @user = User.find(session[:current_user_id])
    unless @user.admin
      redirect_to(:back, :notice => "You are no admin")
    end
  end

  def authorize_teacher
    @user = User.find(session[:current_user_id])
    unless @user.teacher
      redirect_to(:back, :notice => "You are no teacher")
    end
  end

  def authorize_learner
    @user = User.find(session[:current_user_id])
    unless @user.learner
      redirect_to(:back, :notice => "You are no learner")
    end
  end
end
