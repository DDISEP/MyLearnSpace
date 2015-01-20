class LearningUnitsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :destroy, :addContent]
  before_action :check_admin,  only:[:new, :create, :edit, :update, :delete, :destroy] #Zugriffsrechte nur für Administratoren!
  skip_before_action :check_login, only: [:new, :create, :edit, :update, :delete, :destroy]#check_admin ersetzt für diese Methoden check_login

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
    @learning_units = @curriculumID.learning_units.build
    @learning_units.knowledge_elements.build
  end

  # GET /learning_units/1/edit
  def edit
    @curriculumID = Curriculum.find(params[:curriculum_id])
  end

  # POST /learning_units
  # POST /learning_units.json
  def create
    @curriculumID = Curriculum.find(params[:curriculum_id])
    @learning_units = @curriculumID.learning_units.build(params[:learning_units])
    respond_to do |format|
      if @learning_units.save
        format.html { redirect_to @curriculumID, notice: "Lehrplaninhalt #{@learning_units.title} wurde erfolgreich angelegt." }
        format.json { render action: 'show', status: :created, location: @learning_units }
      else
        format.html { render action: 'new' }
        format.json { render json: @learning_units.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_units/1
  # PATCH/PUT /learning_units/1.json
  def update
    @curriculumID = Curriculum.find(params[:curriculum_id])
    respond_to do |format|
      if @learning_units.update(item_params)
        format.html { redirect_to @curriculumID, notice: "Lehrplaninhalt #{@learning_units.title} wurde erfolgreich aktualisiert." }
        #redirects to LP-Detail-Site: format.html { redirect_to [@curriculumID, @learning_units], notice: 'Lehrplaninhalt wurde erfolgreich aktualisiert.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @learning_units.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_units/1
  # DELETE /learning_units/1.json
  def destroy
    @id = params[:id].to_i
    @learning_units.destroy
    respond_to do |format|
      format.js 
    end
  end


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
    def set_item
      @learning_units = LearningUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:learning_units).permit(:title, :hours, :descriptionOfContent)
    end
    
end
