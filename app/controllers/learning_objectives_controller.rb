class LearningObjectivesController < ApplicationController

  def check_auth
    if session[:admin] != true then
      flash[:notice] = "Nur Administratoren dürfen LearningObjectives bearbeiten"
      redirect_to @learningObjective
    end
  end

  def index
    @learningObjectives = LearningObjective.all
  end

  def get_learning_Objective
    @learningObjective = LearningObjective.find(params[:id])
  end

  def show
    @learningObjective = LearningObjective.find_by_id(params[:id])
    @cognitiveDimension = @learningObjective.cognitiveDimension_to_s

  end



end