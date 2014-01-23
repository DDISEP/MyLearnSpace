
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery
  #before_action :require_login
  before_action :check_login

  #def require_login
    #@current_user = nil
  #end

  def check_login
    @current_user ||= session[:current_user_id] && 
                     User.find_by(id: session[:current_user_id])
    if @current_user.nil?
      flash[:error] = "Du musst dich dazu erst anmelden:"
      redirect_to new_login_path # halts request cycle
    end
  end
 
end
