class ProgressesController < ApplicationController
  before_action :set_progress, only: [:show, :edit, :update, :destroy]

  # GET /progresses
  # GET /progresses.json
  def index
    @progresses = Progress.all
    @current_user = User.find(session[:current_user_id])
    @knowledgeElements = KnowledgeElement.all
    @Users = User.all
  end

  # GET /progresses/1
  # GET /progresses/1.json
  def show
  end

  # GET /progresses/new
  def new
  end

  # GET /progresses/1/edit
  def edit
  end

  # POST /progresses
  # POST /progresses.json
  def create
    #hier werden der learner sowie die Eingaben der Textfelder gespeichert
    @progress = Progress.new
    @progress.subexercise1_id= params[:ex1_id]
    @progress.subexercise2_id= params[:ex2_id]
    @progress.subexercise3_id= params[:ex3_id]
    @progress.submission1 = params[:text1]
    @progress.submission2 = params[:text2]
    @progress.submission3 = params[:text3]
    @progress.knowledge_element_id = params[:ke_id]
    @progress.learner_id = session[:current_user_id]



    if User.find_by_id(session[:current_user_id]).teacher?
      @progress.teacher_id=session[:current_user_id]
    end

    respond_to do |format|
      if @progress.save
        format.html { redirect_to @progress, notice: 'Die Klausur wurde erfolgreich abgegeben.' }
        format.json { render action: 'show', status: :created, location: @progress }
      else
        format.html { render action: 'new' }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progresses/1
  # PATCH/PUT /progresses/1.json
  def update
    @progress=Progress.find(params[:id])
    @progress.teacher_id= session[:current_user_id]
    respond_to do |format|
      if @progress.update(progress_params)
        format.html { redirect_to @progress, notice: 'Die Leistung wurde erfolgreich bearbeitet' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progresses/1
  # DELETE /progresses/1.json
  def destroy
    @progress.destroy
    respond_to do |format|
      format.html { redirect_to progresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress
      @progress = Progress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def progress_params
      params.require(:progress).permit(:learner_id, :teacher_id, :knowledge_element_id, :grade, :submission1,:submission2,:submission3, :explanation)
    end
end
