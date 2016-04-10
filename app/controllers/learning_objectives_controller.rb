class LearningObjectivesController < ApplicationController

  def check_auth
    if @current_user.admin? != true then
      flash[:error] = "Nur Administratoren dürfen LearningObjectives einsehen und bearbeiten!"
      redirect_to preconditions_map_path
    end
  end

  def index
    check_auth
    @learningObjectives = LearningObjective.all
  end

  def get_learning_Objective
    @learningObjective = LearningObjective.find(params[:id])
  end

  def show
    check_auth
    @learningObjective = LearningObjective.find_by_id(params[:id])
    @cognitiveDimension = @learningObjective.cognitiveDimension_to_s
    @preconditions = @learningObjective.parent_learning_objective_preconditions

  end

  def get_knowlegde_element
    return @knowledge_element
  end



end
