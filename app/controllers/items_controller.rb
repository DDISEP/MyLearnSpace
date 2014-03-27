class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :destroy, :addContent]
  before_action :check_admin,  only:[:new, :create, :edit, :update, :delete, :destroy] #Zugriffsrechte nur für Administratoren!
  skip_before_action :check_login, only: [:new, :create, :edit, :update, :delete, :destroy]#check_admin ersetzt für diese Methoden check_login

  # GET /items
  # GET /items.json
  #def index
  #  @items = Item.all 
  #end

  # GET /items/1
  # GET /items/1.json
  #def show
  #end

  # GET /items/new
  def new
    @curriculumID = Curriculum.find(params[:curriculum_id])
    @item = @curriculumID.items.build
  end

  # GET /items/1/edit
  def edit
    @curriculumID = Curriculum.find(params[:curriculum_id])
  end

  # POST /items
  # POST /items.json
  def create
    @curriculumID = Curriculum.find(params[:curriculum_id])
    @item = @curriculumID.items.build(params[:item])
    respond_to do |format|
      if @item.save
        format.html { redirect_to @curriculumID, notice: "Lehrplaninhalt #{@item.title} wurde erfolgreich angelegt." }
        format.json { render action: 'show', status: :created, location: @item }        
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json    
  def update
    @curriculumID = Curriculum.find(params[:curriculum_id])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @curriculumID, notice: "Lehrplaninhalt #{@item.title} wurde erfolgreich aktualisiert." }
        #redirects to LP-Detail-Site: format.html { redirect_to [@curriculumID, @item], notice: 'Lehrplaninhalt wurde erfolgreich aktualisiert.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @id = params[:id].to_i
    @item.destroy
    respond_to do |format|
      format.js 
    end
  end

  #Testet, ob ein Administrator eingeloggt ist
  def check_admin
    @curriculum_id = Curriculum.find(params[:curriculum_id])
      @admin = session[:admin]
      if @admin!=true
        if session[:current_user_id].nil?
          redirect_to root_url, :notice => "Du bist kein Administrator!"
        else
          redirect_to curriculum_path(@curriculum_id), :notice => "Das darfst du nur als Administrator!"
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :hours, :descriptionOfContent)
    end
    
    #Add contents to items
    def addContent    
      @curriculumID = Curriculum.find(params[:curriculum_id])   
    end
end
