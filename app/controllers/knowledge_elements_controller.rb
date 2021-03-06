class KnowledgeElementsController < ApplicationController

  before_action :check_auth, only:[:update, :destroy, :new, :edit, :create ]

  def check_auth
    if @current_user.admin? != true then
      flash[:error] = "Nur Administratoren dürfen KnowledgeElemente anlegen und bearbeiten"
      redirect_to preconditions_map_path
    end
  end

  def check_not_learner
    if @current_user.learner?
      flash[:error] = "Nur Administratoren und Lehrer dürfen auf diese Seite zugreifen"
      redirect_to preconditions_map_path
    end
  end

  # method for the index view, that lists all knowledgeElements
  def index
    check_not_learner
    @knowledgeElements = KnowledgeElement.all
  end

  # method for the new view, the form in the view calls the create method, so this method is empty
  def new
    check_auth

  end

  def edit
    check_auth
    @knowledgeElement = KnowledgeElement.find_by_id(params[:id])
    @topics = Topic.all
  end

  def update

    @knowledgeElement = KnowledgeElement.find_by_id(params[:id])
    if(!params[:knowledge_element][:topic].nil?)
      @topic = Topic.find_by_id(params[:knowledge_element][:topic])
      @knowledgeElement.topic = @topic
      @knowledgeElement.save
    end
    @name = params[:knowledge_element][:name]
    if @knowledgeElement.name == @name || KnowledgeElement.where(:name => @name).length < 1
      if KnowledgeElement.update(params[:id], :name => params[:knowledge_element][:name], :description=> params[:knowledge_element][:description], :topic_id => params[:knowledge_element][:topic])
        redirect_to knowledge_element_path(params[:id])
      elsif
        flash[:error] = "Die Änderung konnte nicht gespeichert werden. Überprüfe bitte, ob das KnowledgeElement schon vorhanden ist, oder alle Felder ausgefüllt sind"
        render 'edit'
      end
    elsif
      flash[:error] = "Ein KnowledgeElement mit diesem Namen existiert bereits"
      render 'edit'
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
      # Code creates the LearningObjectives for the KnowledgeElement
      6.times {|i| @knowledgeElement.learning_objectives.build(cognitiveDimension: (i+1))}
      
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
  end

  def destroy
    @knowledgeElement = KnowledgeElement.find(params[:id])
    @knowledgeElement.destroy
    redirect_to @knowledgeElement, :notice => "Das KnowledgeElement wurde erfolgreich gelöscht!"
  end
end
