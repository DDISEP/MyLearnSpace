class TopicsController < ApplicationController

  def check_auth
    if session[:admin] != true then
      flash[:notice] = "Nur Administratoren dürfen Topics erstellen und bearbeiten"
      redirect_to @topic
    end
  end

  def index

  end

  def new

  end
end
