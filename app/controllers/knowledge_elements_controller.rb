class KnowledgeElementsController < ApplicationController

  # method for the index view, that lists all knowledgeElements
  def index
    @knowledgeElements = KnowledgeElement.all
  end

  def check_auth
    if session[:admin] != true then
      flash[:notice] = "Nur Administratoren dürfen KnowledgeElemente erstellen und bearbeiten"
      redirect_to @knowledgeElement
    end
  end


  # method for the new view, the form in the view calls the create method, so this method is empty
  def new

  end

  def edit
    @knowledgeElement = KnowledgeElement.find(params[:id])
    @topics = Topic.all
  end

  def update
    KnowledgeElement.update(params[:id], :name => params[:knowledge_element][:name], :description=> params[:knowledge_element][:description])
    #flash[:notice] = params.inspect
    redirect_to knowledge_element_path(params[:id])
  end

  # method for craeting new KnowledgeElements
  def create
    @admin = session[:admin]
    @knowledgeElement = KnowledgeElement.new(params.require(:knowledgeElement).permit(:name, :description))
    #You can add an object to a collection without saving it by using the collection.build method
    #The Object has been instantiated with attributes and linked to this object through the join table, but has not yet been saved
    #Important if you haven't saved the Object (knowledgeElement) before building the collection
    6.times {|i| @knowledgeElement.learning_objectives.build(cognitiveDimension: (i+1))}
    @knowledgeElement.knowledge_element_chat
    @knowledgeElement.forum
    if @knowledgeElement.save
      redirect_to @knowledgeElement
    else
      #render method is used so that the @knowledgeElement object is passed backto the new template when it is rendered
      #this rendering isdone within the same request as the form submission whereas the redirect_to will tell the browser to issue another request
      render 'new'
    end
  end

  def show
    @knowledgeElement = KnowledgeElement.find_by_id(params[:id])
    if !@knowledgeElement.nil?
      @learningObjectives = @knowledgeElement.learning_objectives.all
      @exams = nil
      @knowledgeElementForum = nil
      @exercises1=nil
      @exercises2=nil
      @exercises3=nil
      @exercises4=nil
      @exercises5=nil
      @exercises6=nil
    end
    #@exams = KnowledgeElement.exams.all
    #@knowledgeElementForum = KnowledgeElement.forum.first
  end

  def destroy
    @knowledgeElement = KnowledgeElement.find(params[:id])
    @knowledgeElement.destroy
    redirect_to knowledge_element_path, :notice => "The knowledgeElement has been deleted"
  end
end
