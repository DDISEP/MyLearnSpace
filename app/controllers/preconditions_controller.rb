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
    @learningObjective = LearningObjective.find_by_id(params[:learning_objective_id])
    @necessity = params["precondition"]["necessity"]
    @parent_learning_objective = LearningObjective.find_by_id(params["precondition"]["parent_learning_objective_id"])
    #@parent_learning_objective = LearningObjective.find_by_id(params[:preconditions[:parent_learning_objective_id]][:value].to_i)
    #@necessity = params[:precondition[:necessity]].to_s.to_i
    #@precondition = @learningObjective.parent_learning_objective_preconditions.build(:learning_objective => @learningObjective, :necessity => @necessity, :parent_learning_objective => @parent_learning_objective)
    @precondition = @learningObjective.parent_learning_objective_preconditions.build(:learning_objective => @learningObjective, :necessity => @necessity, :parent_learning_objective => @parent_learning_objective)
    #@precondition = @learningObjective.parent_learning_objective_preconditions.build(params.require(:precondition).permit(:necessity, :parent_learning_objective_id), :learning_objective_id)
    @precondition.parent_learning_objective = @parent_learning_objective

    #flash[:notice] = params.inspect
    if @precondition.save
      flash[:notice] = "Die Lernvorraussetzung wurde erfolgreich gespeichert"
      redirect_to knowledge_elements_path
    else
      flash[:notice] = "Es ist ein Fehler beim speichern der Lernvorraussetzung aufgetreten. Bitte versuchen Sie es später erneut"
      redirect_to knowledge_elements_url
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
