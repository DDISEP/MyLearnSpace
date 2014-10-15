class PerformancesController < ApplicationController
  
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
