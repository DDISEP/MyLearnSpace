class LearningObjectiveController < ApplicationController

  def get_learning_Objective
    @learningObjective = LearningObjective.find(params[:id])
  end

end
