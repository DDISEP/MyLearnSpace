class ContentsController < ApplicationController

  before_action :set_content, only: [:edit, :update, :destroy]
  before_action :check_admin,  only:[:new, :create, :edit, :update, :delete, :destroy] #Zugriffsrechte nur für Administratoren!
  skip_before_action :check_login, only: [:new, :create, :edit, :update, :delete, :destroy]#check_admin ersetzt für diese Methoden check_login

  

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.find(:all, :order => :tag)
  end

  # GET /contents/1
  # GET /contents/1.json
  #def show
  #end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to contents_path, notice: "Schlagwort #{@content.tag} wurde erfolgreich angelegt." }
        format.json { render action: 'index', status: :created, location: @content }
      else
        format.html { render action: 'new' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to contents_path, notice: "Schlagwort #{@content.tag} wurde erfolgreich aktualisiert." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @id = params[:id].to_i
    @content.destroy
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
    @contents = Content.autocomplete(:tag, params[:q])
    respond_to do |format|
      format.json {render json: @contents}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:tag)
    end
end
