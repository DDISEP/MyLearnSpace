class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all 
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

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
    #alt: @item = Item.new(item_params)
    #von andi: @item.curriculum_id = params[:item][:curriculum_id]
    respond_to do |format|
      if @item.save
        format.html { redirect_to [@curriculumID, @item], notice: 'Lehrplaninhalt wurde erfolgreich angelegt.' }
        #format.html { render action: 'show',  notice: 'Lehrplaninhalt wurde erfolgreich angelegt.' }
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
    @item = @curriculumID.items.build(params[:item])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to [@curriculumID, @item], notice: 'Lehrplaninhalt wurde erfolgreich aktualisiert.' }
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
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
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
    
    #def add     #Hinzufügen von contents zu items
     # @contents = Contents.all
     # 
    #end
end
