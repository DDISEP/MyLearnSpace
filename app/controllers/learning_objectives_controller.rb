class LearningObjectivesController < ApplicationController

  def check_auth
    if session[:admin] != true then
      flash[:notice] = "Nur Administratoren dürfen LearningObjectives bearbeiten"
      redirect_to @learningObjective
    end
  end

  def create
    @learningObjective = LearningObjective.new
    @learningObjective.cognitiveDimension = params[:cognitiveDimension]
    @learningObjective.knowledge_element = params[:knowledgeElement]
  end

  def get_learning_Objective
    @learningObjective = LearningObjective.find(params[:id])
  end



end
