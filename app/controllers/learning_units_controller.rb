class LearningUnitsController < ApplicationController

  before_action :set_learningUnit, only: [:edit, :update, :destroy, :addKnowledgeElement]
  before_action :authorize_admin,  only:[:new, :create, :edit, :update, :delete, :destroy] #Zugriffsrechte nur für Administratoren!
  skip_before_action :check_login, only: [:new, :create, :edit, :update, :delete, :destroy]#authorize_admin ersetzt für diese Methoden check_login

  # GET /learning_units
  # GET /learning_units.json
  #def index
  #  @learning_units = LearningUnit.all
  #end

  # GET /learning_units/1
  # GET /learning_units/1.json
  #def show
  #end

  # GET /learning_units/new
  def new
    @curriculumID = Curriculum.find(params[:curriculum_id])
    @learningUnit = @curriculumID.learningUnits.build
    @learningUnit.knowledge_elements.build
  end

  # GET /learning_units/1/edit
  def edit
    @curriculumID = Curriculum.find(params[:curriculum_id])
  end

  # POST /learning_units
  # POST /learning_units.json
  def create
    @curriculumID = Curriculum.find(params[:curriculum_id])
    @learningUnit = @curriculumID.learningUnits.build(params[:learning_unit])
    respond_to do |format|
      if @learningUnit.save
        format.html { redirect_to @curriculumID, notice: "Lehrplaninhalt #{@learningUnit.title} wurde erfolgreich angelegt." }
        format.json { render action: 'show', status: :created, location: @learningUnit }
      else
        format.html { render action: 'new' }
        format.json { render json: @learningUnit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_units/1
  # PATCH/PUT /learning_units/1.json
  def update
    @curriculumID = Curriculum.find(params[:curriculum_id])
    respond_to do |format|
      if @learningUnit.update(learningUnit_params)
        format.html { redirect_to @curriculumID, notice: "Lehrplaninhalt #{@learningUnit.title} wurde erfolgreich aktualisiert." }
        #redirects to LP-Detail-Site: format.html { redirect_to [@curriculumID, @learningUnit], notice: 'Lehrplaninhalt wurde erfolgreich aktualisiert.' }
        format.json { head :no_knowledge_element }
      else
        format.html { render action: 'edit' }
        format.json { render json: @learningUnit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_units/1
  # DELETE /learning_units/1.json
  def destroy
    @id = params[:id].to_i
    @learningUnit.destroy
    respond_to do |format|
      format.js 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learningUnit
      @learningUnit = LearningUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learningUnit_params
      params.require(:learningUnit).permit(:title, :hours, :descriptionOfKnowledgeElement)
    end
    
end
