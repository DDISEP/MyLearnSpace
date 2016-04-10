class PerformancesController < ApplicationController

  def new
    @subexercise_id = params[:subexercise_id]
    @subexercise = Subexercise.find(@subexercise_id)
    @performance = Performance.new
  end

  def create
    @performance = Performance.new
    @performance.user_id = session[:current_user_id]
    @performance.handedin = params[:performance][:handedin]
    @performance.subexercise_id = params[:subexercise_id]
    @performance.save
    flash[:notice] = "Abgabe eingegangen."
    redirect_to edit_subexercise_performance_path(params[:subexercise_id], @performance)
  end

  def destroy
    @exercise = Exercise.find(params[:exercise_id])
    Performance.find(params[:id]).destroy
    respond_to do |format|
      format.js 
      format.html {
        flash[:notice] = "Bearbeitungsstand geloescht."
        redirect_to @exercise}
    end 
  end

  def edit
    @subexercise = Subexercise.find(params[:subexercise_id])
    @performance = Performance.find(params[:id])
  end

  def update
    @performance = Performance.find(params[:id])
    @performance.achieved_points = params[:performance][:achieved_points]
    @performance.save
    flash[:notice] = "Gespeichert."
    redirect_to exercises_path()
  end
  
end
