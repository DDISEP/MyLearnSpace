class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def check_auth
    if session[:admin] != true then
      flash[:notice] = "Nur Administratoren dürfen Topics erstellen und bearbeiten"
      redirect_to @topic
    end
  end

  def new

  end

  def edit

  end

  def create
    @admin = session[:admin]
    @topic = Topic.new(params.require(:topic).permit(:name, :subject, :description))
    if @topic.save
      redirect_to topics_url
    else
      #render method is used so that the @knowledgeElement object is passed backto the new template when it is rendered
      #this rendering isdone within the same request as the form submission whereas the redirect_to will tell the browser to issue another request
      render 'new'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to @topic, :notice => "The Topic has been deleted"
  end

  def show
    @topic = Topic.find_by_id(params[:id])
  end
end
