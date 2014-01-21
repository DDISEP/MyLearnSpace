class WelcomeController < ApplicationController
  
  skip_before_action :check_login
  
  def index
    @current_user = nil
  end
end
