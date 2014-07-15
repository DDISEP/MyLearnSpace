class ExercisesController < ApplicationController
  
  before_action :get_exercise, only: [:show, :edit, :update, :delete]
  #before_action :check_auth, only:[:edit, :delete]
  
  #def check_auth
   # if session[:current_user_id] != @exercise.user_id
  #end
  
  def get_exercise
    @exercise = Exercise.find(params[:id])
  end
  
  def index
    @exercises = Exercise.all
  end
  
  def show
  end
  
  def new
    @exercise = Exercise.new
    @exercise.user_id = session[:current_user_id]
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to exercises_path, notice: "Lernaufgabe wurde erfolgreich aktualisiert." }
        #format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exercise.errors}
      end
    end
  end
  
  def create
    @exercise = Exercise.new(exercise_params)
    
   # if session[:name] == nil
   #   @exercise.user_name = 'Unbekannt'
   # else
   #   @exercise.user_name = session[:name]
   # end

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Deine Lernaufgabe wurde angelegt.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def destroy
    @exercise.destroy
    render action: delete
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def exercise_params
    params.require(:exercise).permit(:title, :description)
  end
  
end