class KnowledgeElementsController < ApplicationController

  before_action :set_content, only: [:edit, :update, :destroy]
  before_action :check_admin,  only:[:new, :create, :edit, :update, :delete, :destroy] #Zugriffsrechte nur für Administratoren!
  skip_before_action :check_login, only: [:new, :create, :edit, :update, :delete, :destroy]#check_admin ersetzt für diese Methoden check_login

  

  # GET /knowledge_elements
  # GET /knowledge_elements.json
  def index
    @knowledge_elements = KnowledgeElement.find(:all, :order => :tag)
  end

  # GET /knowledge_elements/1
  # GET /knowledge_elements/1.json
  #def show
  #end

  # GET /knowledge_elements/new
  def new
    @knowledge_elements = KnowledgeElement.new
  end

  # GET /knowledge_elements/1/edit
  def edit
  end

  # POST /knowledge_elements
  # POST /knowledge_elements.json
  def create
    @knowledge_elements = KnowledgeElement.new(content_params)

    respond_to do |format|
      if @knowledge_elements.save
        format.html { redirect_to contents_path, notice: "Schlagwort #{@knowledge_elements.tag} wurde erfolgreich angelegt." }
        format.json { render action: 'index', status: :created, location: @knowledge_elements }
      else
        format.html { render action: 'new' }
        format.json { render json: @knowledge_elements.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knowledge_elements/1
  # PATCH/PUT /knowledge_elements/1.json
  def update
    respond_to do |format|
      if @knowledge_elements.update(content_params)
        format.html { redirect_to contents_path, notice: "Schlagwort #{@knowledge_elements.tag} wurde erfolgreich aktualisiert." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @knowledge_elements.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge_elements/1
  # DELETE /knowledge_elements/1.json
  def destroy
    @id = params[:id].to_i
    @knowledge_elements.destroy
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
          redirect_to contents_path, :notice => "Das darfst du nur als Administrator!"
        end
      end
  end
  
  def autocomplete
    @knowledge_elements = KnowledgeElement.autocomplete(:tag, params[:q])
    respond_to do |format|
      format.json {render json: @knowledge_elements}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @knowledge_elements = KnowledgeElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:knowledge_elements).permit(:tag)
    end
end
