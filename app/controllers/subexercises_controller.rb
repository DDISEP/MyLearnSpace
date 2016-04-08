class SubexercisesController < ApplicationController

  before_action :get_subexercise, only: [:edit, :update, :destroy, :show, :perform, :solution]
  before_action :get_exercise, only: [:edit, :destroy, :create, :show, :perform, :solution, :check_auth]
  before_action :get_performance, only: [:perform, :solution]
  #before_action :check_auth, only:[:edit, :update, :destroy]
  before_action :check_refs, only:[:edit, :update, :destroy, :show, :perform, :solution]

  def check_refs
    @exercise = Exercise.find(@subexercise.exercise_id)
  end

  def check_auth
    if @exercise.user_id != session[:current_user_id] && session[:admin] != true then
      flash[:notice] = "Du bist weder Administrator, noch Autor deser Lernaufgabe!"
      redirect_to @exercise
    end
  end

  def get_performance
    @performance = Performance.where(subexercise_id: @subexercise, user_id: session[:current_user_id]).order('created_at DESC').first
  end

  def count_performance
    return Performance.where(subexercise_id: @subexercise, user_id: session[:current_user_id]).count
  end

  def get_subexercise
    @subexercise = Subexercise.find(params[:id])
  end

  def get_exercise
    return @exercise
  end

  def new
    @exercise = Exercise.find(session[:exercise_id])
    @subexercise = Subexercise.new
  end

  def create
    @subexercise = Subexercise.new          # for some (unknown) reason mass assignment via create didn't work
    @subexercise.exercise_id = params[:exercise_id]
    @subexercise.exercise = Exercise.find(@subexercise.exercise_id)
    @subexercise.text = params[:subexercise][:text]
    @subexercise.points = params[:subexercise][:points]
    @subexercise.cognitive_dimension = params[:subexercise][:learning_objective].to_i
    @subexercise.position = Subexercise.where(exercise_id: @exercise).length + 1
    @subexercise.active = TRUE
    @subexercise.users_id = session[:current_user_id]
    @subexercise.moderated = FALSE
    if User.find(session[:current_user_id]).admin || User.find(session[:current_user_id]).teacher then
      @subexercise.moderated = TRUE
    end
    @subexercise.save
    flash[:notice] = "Teilaufgabe erfolgreich angelegt."
    redirect_to new_solution_path(subexercise_id: @subexercise)
  end

  def index
    @subexercises = Subexercise.where(exercise_id: params[:exercise_id])
  end

  def edit
    session[:exercise_id] = @exercise.id

  end

  def moderate
    @subexercise.moderated = TRUE
    redirect_to exercises_path
  end

  def update
    @subexercise.text = params[:subexercise][:text]
    @subexercise.cognitive_dimension = params[:subexercise][:learning_objective].to_i
    @subexercise.points = params[:subexercise][:points]
    if User.find(session[:current_user_id]).admin || User.find(session[:current_user_id]).teacher then
      @subexercise.moderated = TRUE
    end
    @subexercise.save
    flash[:notice] = "Teilaufgabe erfolgreich geaendert."
    if Solution.where(subexercise_id: @subexercise.id).count > 0 then
      redirect_to edit_solution_path(Solution.where(subexercise_id: @subexercise.id).first)
    else
      redirect_to new_solution_path(subexercise_id: @subexercise)
    end
  end

  def destroy
    flash[:notice] = "Teilaufgabe erfolgreich entfernt."
    respond_to do |format|
      format.js {}
      format.html {}
    end
    @subexercise.active = :false
    @subexercise.position = nil
    @subexercise.save
    #@exercise.update_subnumbers #Nummerierungen der Teilaufgaben aktualisieren
    redirect_to exercise_path(session[:exercise_id]) #subexercise soll nicht ganz gelöscht werden, sondern nur unsichtbar geschalten werden
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

  #def solution
  #  @answer = params[:answer]
  #  @current_subexercise_position = Subexercise.all(:conditions => ["exercise_id = ? AND position <= ?", @exercise.id, @performance.current_position]).length
  #  @next = Subexercise.all(:conditions => ["exercise_id = ? AND position > ?", @exercise.id, @performance.current_position] ).sort_by{|s| s.position}.first
  #  if @next != nil then
  #    @performance.current_position = @next.position
  #    @performance.save
  #  else                                            # Solution of last subexercise, meaning the exercise has benn completed
  #    @performance.current_position = -1            # -1 as mark for end
  #    @performance.save
  #  end

  #end

  def show
  end

  def setNumber
    @position = params[:number]
  end

  def setSolution
    @solution_id = params[:solution_id]
  end

end