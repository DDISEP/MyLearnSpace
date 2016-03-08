class SubexercisesController < ApplicationController
  
  before_action :get_subexercise, only: [:edit, :update, :destroy, :show, :perform, :solution]
  before_action :get_exercise, only: [:edit, :destroy, :create, :show, :perform, :solution, :check_auth]
  before_action :get_performance, only: [:perform, :solution]
  #before_action :check_auth, only:[:edit, :update, :destroy]
  
  def check_auth
    if @exercise.user_id != session[:current_user_id] && session[:admin] != true then
      flash[:notice] = "Du bist weder Administrator, noch Autor deser Lernaufgabe!"
      redirect_to @exercise
    end
  end
  
  def get_performance
    @performance = Performance.where(exercise_id: params[:exercise_id], user_id: session[:current_user_id]).order('created_at DESC').first
  end
  
  def get_subexercise
    @subexercise = Subexercise.find(params[:id])
  end
  
  def get_exercise
    @exercise = Exercise.find(params[:exercise_id])
  end
  
  #def post_new
  #  @exercise = Exercise.find(params[:exercise_id])
  #  @subexercise = Subexercise.new
  #end

  def new
    @exercise = Exercise.find(params[:exercise_id])
    @subexercise = Subexercise.new
  end
  
  def create
    @subexercise = Subexercise.new          # for some (unknown) reason mass assignment via create didn't work
    @subexercise.exercise_id = params[:exercise_id]
    @subexercise.text = params[:subexercise][:text]
    #@subexercise.solution = params[:subexercise][:solution]
    @subexercise.points = params[:subexercise][:points]
    @subexercise.position = @exercise.subexercise_counter
    @subexercise.save
    flash[:notice] = "Teilaufgabe erfolgreich angelegt."
    redirect_to edit_exercise_path(params[:exercise_id])
  end
  
  def index
    @subexercises = Subexercise.where(exercise_id: params[:exercise_id])
  end
  
  def edit
    
  end
  
  def update
    @subexercise.text = params[:subexercise][:text]
    @subexercise.solution = params[:subexercise][:solution]
    @subexercise.points = params[:subexercise][:points]
    @subexercise.save
    flash[:notice] = "Teilaufgabe erfolgreich geaendert."
    redirect_to edit_exercise_path(params[:exercise_id])
  end
  
  def destroy
    @subexercise.destroy
    flash[:notice] = "Teilaufgabe erfolgreich entfernt."
    respond_to do |format|
      format.js {}
      format.html {}
    end
    @subexercise.active = :false
    @subexercise.position = nil
    @subexercise.save
    @exercise.update_subnumbers #Nummerierungen der Teilaufgaben aktualisieren
    #redirect_to edit_exercise_path(@exercise) #subexercise soll nicht ganz gelöscht werden, sondern nur unsichtbar geschalten werden
  end
  
  def perform
    @current_subexercise_position = Subexercise.all(:conditions => ["exercise_id = ? AND position <= ?", @exercise.id, @performance.current_position]).length 
     puts @subexercise.position > 0
     puts params[:given_points] != nil
     puts @performance.achieved_points
    if @subexercise.position > 0 && params[:given_points] != nil then
      puts "HELLO!"
      @performance.achieved_points = @performance.achieved_points + params[:given_points].to_i
      @performance.save
    end
    puts @performance.achieved_points 
  end
  
  def solution
    
    @answer = params[:answer]
    @current_subexercise_position = Subexercise.all(:conditions => ["exercise_id = ? AND position <= ?", @exercise.id, @performance.current_position]).length 
    @next = Subexercise.all(:conditions => ["exercise_id = ? AND position > ?", @exercise.id, @performance.current_position] ).sort_by{|s| s.position}.first
    if @next != nil then
      @performance.current_position = @next.position
      @performance.save
    else                                            # Solution of last subexercise, meaning the exercise has benn completed
      @performance.current_position = -1            # -1 as mark for end
      @performance.save
    end
    
  end
  
  def show
    
  end

  def setNumber
    @position = params[:number]
  end
  
end
