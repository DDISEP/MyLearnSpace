class MaterialtextsController < ApplicationController
  before_action :set_materialtext, only: [:show, :edit, :update, :destroy]

  # GET /materialtexts
  # GET /materialtexts.json
  def index
    @materialtexts = Materialtext.all
    @current_user = User.find(session[:current_user_id])
    @user = User.all
  end

  # GET /materialtexts/1
  # GET /materialtexts/1.json
  def show
    @user_author = User.find_by_id(@materialtext.user_id)
    @user_author_name = @user_author.username
  end

  # GET /materialtexts/new
  def new
    @materialtext = Materialtext.new
  end

  # GET /materialtexts/1/edit
  def edit
  end

  # POST /materialtexts
  # POST /materialtexts.json
  def create
    @materialtext = Materialtext.new(materialtext_params)
    @materialtext.user_id = @current_user.id


    respond_to do |format|
      if @materialtext.save
        format.html { redirect_to @materialtext, notice: 'Der Text wurde erfolgreich erstellt!' }
        format.json { render action: 'show', status: :created, location: @materialtext }
      else
        format.html { render action: 'new' }
        format.json { render json: @materialtext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materialtexts/1
  # PATCH/PUT /materialtexts/1.json
  def update
    @current_user = User.find(session[:current_user_id])
    @user_author = User.find_by_id(@materialtext.user_id)


    if @user_author.id == @current_user.id
      respond_to do |format|
        if @materialtext.update(materialtext_params)
          format.html { redirect_to @materialtext, notice: 'Der Text wurde erfolgreich bearbeitet!' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @materialtext.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @materialtext, notice: 'Nur der Autor darf seine Materialien bearbeiten!' }
       #format.js {render js: "alert('Nur Autoren dürfen ihre Materialien bearbeiten!');"}
        format.html {render text: "Nur der Autor darf seine Materialien bearbeiten!"}
      end
    end
  end

  # DELETE /materialtexts/1
  # DELETE /materialtexts/1.json
  def destroy
    @current_user = User.find(session[:current_user_id])
    @user_author = User.find_by_id(@materialtext.user_id)

    if (@user_author.id == @current_user.id) || @current_user.admin?
      @materialtext.destroy
      respond_to do |format|
        format.html { redirect_to materials_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @materialtext, notice: 'Nur der Autor oder ein Admin Materialien löschen!' }
        #format.js {render js: "alert('Nur Autoren dürfen ihre Materialien bearbeiten!');"}
        format.html {render text: "Nur der Autor oder ein Admin Materialien löschen!"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materialtext
      @materialtext = Materialtext.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materialtext_params
      params.require(:materialtext).permit(:title, :text, :user_id)
    end
end
