class MaterialpicturesController < ApplicationController
  before_action :set_materialpicture, only: [:show, :edit, :update, :destroy]

  # GET /materialpictures
  # GET /materialpictures.json
  def index
    @materialpictures = Materialpicture.all
    @current_user = User.find(session[:current_user_id])
    @user = User.all
  end

  # GET /materialpictures/1
  # GET /materialpictures/1.json
  def show
    @user_author = User.find_by_id(@materialpicture.user_id)
    @user_author_name = @user_author.username
  end

  # GET /materialpictures/new
  def new
    @materialpicture = Materialpicture.new
  end

  # GET /materialpictures/1/edit
  def edit
  end

  # POST /materialpictures
  # POST /materialpictures.json
  def create
    @materialpicture = Materiallink.new(materialpicture_params)
    @materialpicture.user_id = @current_user.id

    respond_to do |format|
      if @materialpicture.save
        format.html { redirect_to @materialpicture, notice: 'Das Bild wurde erfolgreich erstellt!' }
        format.json { render action: 'show', status: :created, location: @materialpicture }
      else
        format.html { render action: 'new' }
        format.json { render json: @materialpicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materialpictures/1
  # PATCH/PUT /materialpictures/1.json
  def update
    @materialpicture = Materialpicture.new(materialpicture_params)
    @materialpicture.user_id = @current_user.id

    if @user_author.id == @current_user.id
      respond_to do |format|
        if @materialpicture.update(materialpicture_params)
          format.html { redirect_to @materialpicture, notice: 'Das Bild wurde erfolgreich bearbeitet!' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @materialpicture.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @materialpicture, notice: 'Nur der Autor darf seine Materialien bearbeiten!' }
        #format.js {render js: "alert('Nur Autoren dürfen ihre Materialien bearbeiten!');"}
        format.html {render text: "Nur der Autor darf seine Materialien bearbeiten!"}
      end
    end
  end

  # DELETE /materialpictures/1
  # DELETE /materialpictures/1.json
  def destroy
    @current_user = User.find(session[:current_user_id])
    @user_author = User.find_by_id(@materialpicture.user_id)

    if (@user_author.id == @current_user.id) || @current_user.admin?
      @materialpicture.destroy
      respond_to do |format|
        format.html { redirect_to materials_url, notice: 'Das Bild wurde erfolgreich gelöscht!' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @materialpicture, notice: 'Nur der Autor oder ein Admin dürfen Materialien löschen!' }
        #format.js {render js: "alert('Nur Autoren dürfen ihre Materialien bearbeiten!');"}
        format.html {render text: "Nur der Autor oder ein Admin dürfen Materialien löschen!"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materialpicture
      @materialpicture = Materialpicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materialpicture_params
      params.require(:materialpicture).permit(:title, :file, :filename, :fileformat, :user_id)
    end
end
