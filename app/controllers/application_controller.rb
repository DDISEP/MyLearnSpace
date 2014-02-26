
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery

  before_action :check_login
  
  def check_login
    unless session[:current_user_id].nil?
      @current_user = User.find(session[:current_user_id])
    else
      flash[:error] = "Du musst dich dazu erst anmelden:"
      redirect_to root_url 
    end
  end
 
end
