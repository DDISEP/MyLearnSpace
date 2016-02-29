class MaterialvideosController < ApplicationController
  before_action :set_materialvideo, only: [:show, :edit, :update, :destroy]

  # GET /materialvideos
  # GET /materialvideos.json
  def index
    @materialvideos = Materialvideo.all
  end

  # GET /materialvideos/1
  # GET /materialvideos/1.json
  def show
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

    respond_to do |format|
      if @materialvideo.save
        format.html { redirect_to @materialvideo, notice: 'Materialvideo was successfully created.' }
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
    respond_to do |format|
      if @materialvideo.update(materialvideo_params)
        format.html { redirect_to @materialvideo, notice: 'Materialvideo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @materialvideo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materialvideos/1
  # DELETE /materialvideos/1.json
  def destroy
    @materialvideo.destroy
    respond_to do |format|
      format.html { redirect_to materialvideos_url }
      format.json { head :no_content }
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
