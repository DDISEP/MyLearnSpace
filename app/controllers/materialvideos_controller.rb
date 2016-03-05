class MaterialvideosController < ApplicationController
  before_action :set_materialvideo, only: [:show, :edit, :update, :destroy]

  # GET /materialvideos
  # GET /materialvideos.json
  def index
    @materialvideos = Materialvideo.all
    @current_user = User.find(session[:current_user_id])
    @user = User.all
  end

  # GET /materialvideos/1
  # GET /materialvideos/1.json
  def show
    @user_author = User.find_by_id(@materialvideo.user_id)
    @user_author_name = @user_author.username
  end

  # GET /materialvideos/new
  def new
    @materialvideo = Materialvideo.new
  end

  # GET /materialvideos/1/edit
  def edit
  end

  # POST /materialvideos
  # POST /materialvideos.json
  def create
    @materialvideo = Materialvideo.new(materialvideo_params)
    @materialvideo.user_id = @current_user.id

    respond_to do |format|
      if @materialvideo.save
        format.html { redirect_to @materialvideo, notice: 'Das Video wurde erfolgreich erstellt!' }
        format.json { render action: 'show', status: :created, location: @materialvideo }
      else
        format.html { render action: 'new' }
        format.json { render json: @materialvideo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materialvideos/1
  # PATCH/PUT /materialvideos/1.json
  def update
    @current_user = User.find(session[:current_user_id])
    @user_author = User.find_by_id(@materialvideo.user_id)

    if @user_author.id == @current_user.id
      respond_to do |format|
        if @materialvideo.update(materialvideo_params)
          format.html { redirect_to @materialvideo, notice: 'Das Video wurde erfolgreich bearbeitet!' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @materialvideo.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @materialvideo, notice: 'Nur der Autor darf seine Materialien bearbeiten!' }
        #format.js {render js: "alert('Nur Autoren dürfen ihre Materialien bearbeiten!');"}
        format.html {render text: "Nur der Autor darf seine Materialien bearbeiten!"}
      end
    end
  end

  # DELETE /materialvideos/1
  # DELETE /materialvideos/1.json
  def destroy
    @current_user = User.find(session[:current_user_id])
    @user_author = User.find_by_id(@materialvideo.user_id)

    if (@user_author.id == @current_user.id) || @current_user.admin?
      @materialvideo.destroy
      respond_to do |format|
        format.html { redirect_to materials_url, notice: 'Das Video wurde erfolgreich gelöscht!' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @materialvideo, notice: 'Nur der Autor oder ein Admin dürfen Materialien löschen!' }
        #format.js {render js: "alert('Nur Autoren dürfen ihre Materialien bearbeiten!');"}
        format.html {render text: "Nur der Autor oder ein Admin dürfen Materialien löschen!"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materialvideo
      @materialvideo = Materialvideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materialvideo_params
      params.require(:materialvideo).permit(:title, :file, :filename, :fileformat, :user_id)
    end
end
