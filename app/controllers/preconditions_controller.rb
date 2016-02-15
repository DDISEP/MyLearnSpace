class PreconditionsController < ApplicationController

  def check_auth
    if session[:admin] != true then
      flash[:notice] = "Nur Administratoren dürfen Preconditions erstellen und bearbeiten"
      redirect_to @precondition
    end
  end

  def create
    @precondition = LearningObjective.get_learning_objective(:learning_objective_id).preconditions.build(:parent_learning_objective_id => params[:parent_learning_objective_id])
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
end
