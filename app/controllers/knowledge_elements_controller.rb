class KnowledgeElementsController < ApplicationController

  # method for the index view, that lists all knowledgeElements
  def index
    @knowledgeElements = KnowledgeElement.all
  end

  def check_auth
    if session[:admin] != true then
      flash[:error] = "Nur Administratoren dürfen KnowledgeElemente erstellen und bearbeiten"
      redirect_to @knowledgeElement
    end
  end


  # method for the new view, the form in the view calls the create method, so this method is empty
  def new

  end

  def edit
    @knowledgeElement = KnowledgeElement.find_by_id(params[:id])
    @topics = Topic.all
  end

  def update
    if(!params[:knowledge_element][:topic].nil?)
      @topic = Topic.find_by_id(params[:knowledge_element][:topic])
      @knowledgeElement = KnowledgeElement.find_by_id(params[:id])
      @knowledgeElement.topic = @topic
      @knowledgeElement.save
    end
    @name = params[:knowledge_element][:name]
    if KnowledgeElement.where(:name => @name).length < 1
      if KnowledgeElement.update(params[:id], :name => params[:knowledge_element][:name], :description=> params[:knowledge_element][:description], :topic_id => params[:knowledge_element][:topic])
        redirect_to knowledge_element_path(params[:id])
      elsif
        flash[:error] = "Die Änderung konnte nicht gespeichert werden. Überprüfe bitte, ob das KnowledgeElement schon vorhanden ist, oder alle Felder ausgefüllt sind"
        render 'new'
      end
    elsif
      flash[:error] = "Ein KnowledgeElement mit diesem Namen existiert bereits"
      render 'new'
    end


  end

  # method for craeting new KnowledgeElements
  def create
    @admin = session[:admin]
    @name = params[:knowledgeElement][:name]
    if KnowledgeElement.where(:name => @name ).length <1
      @knowledgeElement = KnowledgeElement.new(params.require(:knowledgeElement).permit(:name, :description))
      #You can add an object to a collection without saving it by using the collection.build method
      #The Object has been instantiated with attributes and linked to this object through the join table, but has not yet been saved
      #Important if you haven't saved the Object (knowledgeElement) before building the collection
      6.times {|i| @knowledgeElement.learning_objectives.build(cognitiveDimension: (i+1))}
      #@knowledgeElement.knowledge_element_chat
      #@knowledgeElement.forum
      if @knowledgeElement.save
        redirect_to @knowledgeElement
      else
        #render method is used so that the @knowledgeElement object is passed back to the new template when it is rendered
        #this rendering is done within the same request as the form submission whereas the redirect_to will tell the browser to issue another request
        flash[:error] = "Das KnowledgeElement konnte nicht gespeichert werden"
        render 'new'
      end
    elsif
      flash[:error] = "Dieses KnowledgeElement existiert bereits"
      render 'new'
    end
  end

  def show
    @knowledgeElement = KnowledgeElement.find_by_id(params[:id])
    if !@knowledgeElement.nil?
      @learningObjectives = @knowledgeElement.learning_objectives.all
      @exams = @knowledgeElement.exams
      @questions = @knowledgeElement.questions
      @exercises = @knowledgeElement.exercises
      @materialtexts = @knowledgeElement.materialtexts
      @materiallinks = @knowledgeElement.materiallinks
      @materialdocuments = @knowledgeElement.materialdocuments
      @materialpictures = @knowledgeElement.materialpictures
      @materialvideos = @knowledgeElement.materialvideos
      @topic = @knowledgeElement.topic
    end
    #@exams = KnowledgeElement.exams.all
    #@knowledgeElementForum = KnowledgeElement.forum.first
  end

  def destroy
    @knowledgeElement = KnowledgeElement.find(params[:id])
    @knowledgeElement.destroy
    redirect_to @knowledgeElement, :notice => "Das KnowledgeElement wurde erfolgreich gelöscht!"
  end
end
