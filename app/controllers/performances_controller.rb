class PerformancesController < ApplicationController
  
  def destroy
    @task = Task.find(params[:exercise_id])
    Performance.find(params[:id]).destroy
    respond_to do |format|
      format.js 
      format.html {
        flash[:notice] = "Bearbeitungsstand geloescht."
        redirect_to @task}
    end 
  end
  
end
