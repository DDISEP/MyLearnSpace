class ExercisesController < ApplicationController
  
  before_action :get_subexercise, only: [:edit, :update, :destroy, :show, :perform, :solution]
  before_action :get_exercise, only: [:edit, :destroy, :create, :show, :perform, :solution, :check_auth]
  before_action :get_performance, only: [:perform, :solution]
  #before_action :check_auth, only:[:edit, :update, :destroy]
  
  def check_auth
    if @task.user_id != session[:current_user_id] && session[:admin] != true then
      flash[:notice] = "Du bist weder Administrator, noch Autor deser Lernaufgabe!"
      redirect_to @task
    end
  end
  
  def get_performance
    @performance = Performance.where(exercise_id: params[:exercise_id], user_id: session[:current_user_id]).order('created_at DESC').first
  end
  
  def get_subexercise
    @exercises = Exercise.find(params[:id])
  end
  
  def get_exercise
    @task = Task.find(params[:exercise_id])
  end
  
  def new
    @task = Task.find(params[:exercise_id])
    @exercises = Exercise.new
  end
  
  def create
    @exercises = Exercise.new          # for some (unknown) reason mass assignment via create didn't work
    @exercises.exercise_id = params[:exercise_id]
    @exercises.text = params[:exercises][:text]
    @exercises.solution = params[:exercises][:solution]
    @exercises.points = params[:exercises][:points]
    @exercises.position = @task.subexercise_counter
    @exercises.save
    flash[:notice] = "Teilaufgabe erfolgreich angelegt."
    redirect_to edit_exercise_path(params[:exercise_id])
  end
  
  def index
    @subtasks = Exercise.where(exercise_id: params[:exercise_id])
  end
  
  def edit
    
  end
  
  def update
    @exercises.text = params[:exercises][:text]
    @exercises.solution = params[:exercises][:solution]
    @exercises.points = params[:exercises][:points]
    @exercises.save
    flash[:notice] = "Teilaufgabe erfolgreich geaendert."
    redirect_to edit_exercise_path(params[:exercise_id])
  end
  
  def destroy
    @exercises.destroy
    flash[:notice] = "Teilaufgabe erfolgreich geloescht."
    respond_to do |format|
      format.js {}
      format.html {}
    end 
    redirect_to edit_exercise_path(@task)
  end
  
  def perform
    @current_subexercise_position = Exercise.all(:conditions => ["exercise_id = ? AND position <= ?", @task.id, @performance.current_position]).length
     puts @exercises.position > 0
     puts params[:given_points] != nil
     puts @performance.achieved_points
    if @exercises.position > 0 && params[:given_points] != nil then
      puts "HELLO!"
      @performance.achieved_points = @performance.achieved_points + params[:given_points].to_i
      @performance.save
    end
    puts @performance.achieved_points 
  end
  
  def solution
    
    @answer = params[:answer]
    @current_subexercise_position = Exercise.all(:conditions => ["exercise_id = ? AND position <= ?", @task.id, @performance.current_position]).length
    @next = Exercise.all(:conditions => ["exercise_id = ? AND position > ?", @task.id, @performance.current_position] ).sort_by{|s| s.position}.first
    if @next != nil then
      @performance.current_position = @next.position
      @performance.save
    else                                            # Solution of last exercises, meaning the task has benn completed
      @performance.current_position = -1            # -1 as mark for end
      @performance.save
    end
    
  end
  
  def show
    
  end
  
end
