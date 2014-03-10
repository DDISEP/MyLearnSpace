class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: [:show, :edit, :update, :destroy]
  before_action :check_admin,  only:[:new, :create, :edit, :update, :delete, :destroy] #Zugriffsrechte nur für Administratoren!
  skip_before_action :check_login, only: [:new, :create, :edit, :update, :delete, :destroy]#check_admin ersetzt für diese Methoden check_login

  

  # GET /curriculums
  # GET /curriculums.json
  def index
    @curriculums = Curriculum.find(:all, :order => :country)
  end

  # GET /curriculums/1
  # GET /curriculums/1.json
  def show
  end

  # GET /curriculums/new
  def new
    @curriculum = Curriculum.new
  end

  # GET /curriculums/1/edit
  def edit
  end

  # POST /curriculums
  # POST /curriculums.json
  def create
    @curriculum = Curriculum.new(curriculum_params)

    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to @curriculum, notice: 'Lehrplan wurde erfolgreich angelegt.' }
        format.json { render action: 'show', status: :created, location: @curriculum }
      else
        format.html { render action: 'new' }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculums/1
  # PATCH/PUT /curriculums/1.json
  def update
    respond_to do |format|
      if @curriculum.update(curriculum_params)
        format.html { redirect_to @curriculum, notice: 'Lehrplan wurde erfolgreich aktualisiert.' }
        format.json { head :no_curriculum }
      else
        format.html { render action: 'edit' }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums/1
  # DELETE /curriculums/1.json
  def destroy
    @id = params[:id].to_i
    @curriculum.destroy
    respond_to do |format|
      format.js
    end
  end

  #Testet, ob ein Administrator eingeloggt ist
  def check_admin
      @admin = session[:admin]
      if @admin!=true
        if session[:current_user_id].nil?
          redirect_to root_url, :notice => "Du bist kein Administrator!"
        else
          redirect_to curriculums_path, :notice => "Das darfst du nur als Administrator!"
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_params
      params.require(:curriculum).permit(:country, :state, :profession, :typeOfSchool, :level, :subject)
    end
    
    
 
end
