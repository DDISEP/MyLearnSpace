class KnowledgeElementsController < ApplicationController

  def index
    @knowledgeElements = KnowledgeElement.all
  end

  def check_auth
    if session[:admin] != true then
      flash[:notice] = "Nur Administratoren dürfen KnowledgeElemente erstellen und bearbeiten"
      redirect_to @knowledgeElement
    end
  end

  def new
    @knowledgeElements = KnowledgeElement.new
    #@knowledgeElement = KnowledgeElement.new(params.require(:knowledgeElement).permit(:name, :description))
    #@knowledgeElement.save
    #redirect_to @knowledgeElement
  end

  def create
    @knowledgeElements = KnowledgeElement.new
    @knowledgeElement = KnowledgeElement.new(params.require(:knowledgeElement).permit(:name, :description))
    #@knowledgeElement..learning_objectives[1]=LearningObjective.create(cognitiveDimension: 1, knowledgeElement: self)
    #@knowledgeElement..learning_objectives[2]=LearningObjective.create(cognitiveDimension: 2, knowledgeElement: self)
    #@knowledgeElement..learning_objectives[3]=LearningObjective.create(cognitiveDimension: 3, knowledgeElement: self)
    #@knowledgeElement..learning_objectives[4]=LearningObjective.create(cognitiveDimension: 4, knowledgeElement: self)
    #@knowledgeElement..learning_objectives[5]=LearningObjective.create(cognitiveDimension: 5, knowledgeElement: self)
   # @knowledgeElement..learning_objectives[6]=LearningObjective.create(cognitiveDimension: 6, knowledgeElement: self)
    @knowledgeElement.save
    redirect_to @knowledgeElement
  end

  def show
    @knowledgeElement = KnowledgeElement.find(params[:id])
  end
end
