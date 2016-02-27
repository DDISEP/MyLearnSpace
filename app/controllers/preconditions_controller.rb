class PreconditionsController < ApplicationController

  def check_auth
    if session[:admin] != true then
      flash[:notice] = "Nur Administratoren dürfen Preconditions erstellen und bearbeiten"
      redirect_to @precondition
    end
  end

  def index
    @preconditions = Precondition.all
  end

  def new
    @learningObjective = LearningObjective.find_by_id(:learning_objective_id)
    @knowledgeElements = KnowledgeElement.all
    @preconditions = Precondition.all
  end

  def create
    #@precondition = LearningObjective.find_by_id(params[:learning_objective_id]).parent_learning_objective_preconditions.build(:parent_learning_objective_id => params[:parent_learning_objective_id])
    @precondition = Precondition.new()
    @precondition.child_learning_objective = LearningObjective.find_by_id(params[:child_learning_objective])
    @precondition.parent_learning_objetive = LearningObjective.find_by_id(params[:parent_learning_objective])
    flash[:notice] = params.inspect
    if @precondition.save
      flash[:notice] = "Die Lernvorraussetzung wurde erfolgreich gespeichert"
      redirect_to root_url
    else
      flash[:notice] = "Es ist ein Fehler beim speichern der Lernvorraussetzung aufgetreten. Bitte versuchen Sie es später erneut"
      redirect_to root_url
    end
  end

  def destroy
    @precondition = LearningObjetive.get_learning_objective(:learning_objective_id).preconditions.find(params[:perconditions_id])
    @precondition.destroy
    #output missing
    redirect_to
  end

  def show
    @precondition = Precondition.find_by_id(params[:id])
  end

  def index
    @preconditions = Precondition.all
  end

end
