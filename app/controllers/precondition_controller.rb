class PreconditionController < ApplicationController
  def create
    @precondition = LearningObjective.get_learning_objective(:learning_objective_id).preconditions.build(:parent_learning_objective_id => params[:parent_learning_objective_id])
    if @precondition.save
      #output missing
      redirect_to root_url
    else
      #output missing
      redirect_to root_url
    end
  end

  def destroy
    @precondition = LearningObjetive.get_learning_objective(:learning_objective_id).preconditions.find(params[:perconditions_id])
    @precondition.destroy
    #output missing
    redirect_to
  end
end
