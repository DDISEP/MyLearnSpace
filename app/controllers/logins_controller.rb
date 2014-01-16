class LoginsController < ApplicationController
  # "Create" a login, aka "log the user in"
  skip_before_action :require_login, only: [:new, :create]
  def create
    if user = User.authenticate(params[:username], params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to root_url, :notice => "Erfolgreich angemeldet!"
    else
      flash.now.alert = "Invalid email or password"  
      render "new"
    end
  end  
  #"Delete" a login, aka "log the user out"
  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "Erfolgreich abgemeldet!"
    redirect_to root_url
  end
end