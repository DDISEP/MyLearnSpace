class KnowledgeElementsController < ApplicationController

  before_action :set_knowledge_element, only: [:edit, :update, :destroy]
  before_action :authorize_admin,  only:[:new, :create, :edit, :update, :delete, :destroy] #Zugriffsrechte nur für Administratoren!
  skip_before_action :check_login, only: [:new, :create, :edit, :update, :delete, :destroy]#authorize_admin ersetzt für diese Methoden check_login

  

  # GET /knowledge_elements
  # GET /knowledge_elements.json
  def index
    @knowledge_elements = KnowledgeElement.all
  end

  # GET /knowledge_elements/1
  # GET /knowledge_elements/1.json
  def show
    @knowledge_element = KnowledgeElement.find(params[:id])
    @knmessage = Knmessage.new(:knowledge_element_id => @knowledge_element.id)
  end

  # GET /knowledge_elements/new
  def new
    @knowledge_element = KnowledgeElement.new
  end

  # GET /knowledge_elements/1/edit
  def edit
    @knowledge_element = KnowledgeElement.find(params[:id])
  end

  # POST /knowledge_elements
  # POST /knowledge_elements.json
  def create
    @knowledge_element = KnowledgeElement.new(knowledge_element_params)

    respond_to do |format|
      if @knowledge_element.save
        format.html { redirect_to knowledge_elements_path, notice: "Schlagwort #{@knowledge_element.tag} wurde erfolgreich angelegt." }
        format.json { render action: 'index', status: :created, location: @knowledge_element }
      else
        format.html { render action: 'new' }
        format.json { render json: @knowledge_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knowledge_elements/1
  # PATCH/PUT /knowledge_elements/1.json
  def update
    respond_to do |format|
      if @knowledge_element.update(knowledge_element_params)
        format.html { redirect_to knowledge_elements_path, notice: "Schlagwort #{@knowledge_element.tag} wurde erfolgreich aktualisiert." }
        format.json { head :no_knowledge_element }
      else
        format.html { render action: 'edit' }
        format.json { render json: @knowledge_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge_elements/1
  # DELETE /knowledge_elements/1.json
  def destroy
    @id = params[:id].to_i
    @knowledge_element.destroy
    redirect_to knowledge_elements_path
  end
  
  def autocomplete
    @knowledge_elements = KnowledgeElement.autocomplete(:tag, params[:q])
    respond_to do |format|
      format.json {render json: @knowledge_elements}
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledge_element
      @knowledge_element = KnowledgeElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def knowledge_element_params
      params.require(:knowledge_element).permit(:tag, :name, :content)
    end
end
