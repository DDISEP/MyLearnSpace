class WelcomeController < ApplicationController
  
  skip_before_action :check_login
  
  def index

  end
end
