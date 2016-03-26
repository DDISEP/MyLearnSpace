class PerformancesController < ApplicationController

  def new
    @subexercise_id = params[:subexercise_id]
    @subexercise = Subexercise.find(@subexercise_id)
    @performance = Performance.new
  end

  def create
    @performance = Performance.new
    @performance.user_id = session[:current_user_id]
    @performance.subexercise_id = params[:subexercise_id]
    @performance.handedin = params[:performance][:handedin]
    @performance.save
    flash[:notice] = "Abgabe eingegangen."
    redirect_to exercise_path(Subexercise.find(params[:subexercise_id]).exercise)
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
  
end
