class SubassessmentsController < ApplicationController

  before_action :get_subassessment, only: [:edit, :update, :destroy, :show, :perform, :solution]
  before_action :get_assessment, only: [:edit, :destroy, :create, :show, :perform, :solution, :check_auth]
  before_action :get_performance, only: [:perform, :solution]
  #before_action :check_auth, only:[:edit, :update, :destroy]

  def check_auth
    if @assessment.user_id != session[:current_user_id] && session[:admin] != true then
      flash[:notice] = "Du bist weder Administrator, noch Autor deser Lernaufgabe!"
      redirect_to @assessment
    end
  end

  def get_performance
    @performance = Performance.where(assessment_id: params[:assessment_id], user_id: session[:current_user_id]).order('created_at DESC').first
  end

  def get_subassessment
    @subassessment = Subassessment.find(params[:id])
  end

  def get_assessment
    @assessment = Assessment.find(params[:assessment_id])
  end

  def new
    @assessment = Assessment.find(params[:assessment_id])
    @subassessment = Subassessment.new
  end

  def create
    @subassessment = Subassessment.new          # for some (unknown) reason mass assignment via create didn't work
    @subassessment.assessment_id = params[:assessment_id]
    @subassessment.text = params[:subassessment][:text]
    @subassessment.solution = params[:subassessment][:solution]
    @subassessment.points = params[:subassessment][:points]
    @subassessment.position = @assessment.subassessment_counter
    @subassessment.save
    flash[:notice] = "Teilaufgabe erfolgreich angelegt."
    redirect_to edit_assessment_path(params[:assessment_id])
  end

  def index
    @subassessments = Subassessment.where(assessment_id: params[:assessment_id])
  end

  def edit

  end

  def update
    @subassessment.text = params[:subassessment][:text]
    @subassessment.solution = params[:subassessment][:solution]
    @subassessment.points = params[:subassessment][:points]
    @subassessment.save
    flash[:notice] = "Teilaufgabe erfolgreich geaendert."
    redirect_to edit_assessment_path(params[:assessment_id])
  end

  def destroy
    @subassessment.destroy
    flash[:notice] = "Teilaufgabe erfolgreich geloescht."
    respond_to do |format|
      format.js {}
      format.html {}
    end
    redirect_to edit_assessment_path(@assessment)
  end

  def perform
    @current_subassessment_position = Subassessment.all(:conditions => ["assessment_id = ? AND position <= ?", @assessment.id, @performance.current_position]).length
    puts @subassessment.position > 0
    puts params[:given_points] != nil
    puts @performance.achieved_points
    if @subassessment.position > 0 && params[:given_points] != nil then
      puts "HELLO!"
      @performance.achieved_points = @performance.achieved_points + params[:given_points].to_i
      @performance.save
    end
    puts @performance.achieved_points
  end

  def solution

    @answer = params[:answer]
    @current_subassessment_position = Subassessment.all(:conditions => ["assessment_id = ? AND position <= ?", @assessment.id, @performance.current_position]).length
    @next = Subassessment.all(:conditions => ["assessment_id = ? AND position > ?", @assessment.id, @performance.current_position] ).sort_by{|s| s.position}.first
    if @next != nil then
      @performance.current_position = @next.position
      @performance.save
    else                                            # Solution of last subassessment, meaning the assessment has benn completed
      @performance.current_position = -1            # -1 as mark for end
      @performance.save
    end

  end

  def show

  end

end
