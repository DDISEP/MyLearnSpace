class TopicsController < ApplicationController

  before_action :check_auth, only:[:update, :destroy, :new, :edit, :create ]

  def check_auth
    if @current_user.admin? != true then
      flash[:error] = "Nur Administratoren dürfen Topics anlegen und bearbeiten!"
      redirect_to preconditions_map_path
    end
  end

  def index
    check_auth
    @topics = Topic.all
  end

  def new
check_auth
  end

  def edit
    check_auth
    @topic = Topic.find_by_id(params[:id])
  end

  def create
    check_auth
    @admin = session[:admin]
    @name = params[:topic][:name]
    if Topic.where(:name => @name).length <1
      @topic = Topic.new(params.require(:topic).permit(:name, :subject, :description))
      if @topic.save
        redirect_to topics_url
      else
        #render method is used so that the @knowledgeElement object is passed backto the new template when it is rendered
        #this rendering isdone within the same request as the form submission whereas the redirect_to will tell the browser to issue another request
        render 'new'
      end
    elsif
      flash[:error] = "Dieses Topic existiert bereits!"
      render 'new'
    end
  end

  def update
    @topic = Topic.find_by_id(params[:id])
    if(!params[:topic].nil?)

      @topic.save
    end
    @name = params[:topic][:name]
    if @topic.name == @name || Topic.where(:name => @name).length < 1
      if Topic.update(params[:id], :name => params[:topic][:name], :description=> params[:topic][:description], :subject => params[:topic][:subject])
        redirect_to topic_path(params[:id])
      elsif
      flash[:error] = "Die Änderung konnte nicht gespeichert werden. Überprüfe bitte, ob das Topic schon vorhanden ist, oder alle Felder ausgefüllt sind"
        render 'edit'
      end
    elsif
    flash[:error] = "Ein Topic mit diesem Namen existiert bereits"
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to @topic, :notice => "Das Topic wurde erfolgreich gelöscht!"
  end

  def show
    @topic = Topic.find_by_id(params[:id])
    @knowledgeElements = @topic.knowledge_elements
  end
end
