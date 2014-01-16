
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery

  private 
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
   @_current_user ||= session[:current_user_id] &&
   User.find_by(id: session[:current_user_id])
  end
  #alternativ:
  #def current_user
       #@current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  before_action :require_login
 
 
      
  private
 
  def require_login
    unless logged_in?
      flash[:error] = "Du musst dich dazu erst anmelden!"
      redirect_to new_login_url # halts request cycle
    end
  end
  # The logged_in? method simply returns true if the user is logged 
  # in and false otherwise. It does this by "booleanizing" the 
  # current_user method we created previously using a double ! operator. 
  # Note that this is not common in Ruby and is discouraged unless you 
  # really mean to convert something into true or false.
  def logged_in? 
    !!current_user
  end
end
