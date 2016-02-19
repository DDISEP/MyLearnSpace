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



end
