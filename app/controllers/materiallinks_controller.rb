class MateriallinksController < ApplicationController
  before_action :set_materiallink, only: [:show, :edit, :update, :destroy]

  # GET /materiallinks
  # GET /materiallinks.json
  def index
    @materiallinks = Materiallink.all
    @current_user = User.find(session[:current_user_id])
    @user = User.all
  end

  # GET /materiallinks/1
  # GET /materiallinks/1.json
  def show
    @user_author_id = User.find_by_id(@materiallink.user_id)
    @user_author_name = @user_author_id.username
  end

  # GET /materiallinks/new
  def new
    @materiallink = Materiallink.new
  end

  # GET /materiallinks/1/edit
  def edit
  end

  # POST /materiallinks
  # POST /materiallinks.json
  def create
    @materiallink = Materiallink.new(materiallink_params)
    @materialtext.user_id = @current_user.id

    respond_to do |format|
      if @materiallink.save
        format.html { redirect_to @materiallink, notice: 'Materiallink was successfully created.' }
        format.json { render action: 'show', status: :created, location: @materiallink }
      else
        format.html { render action: 'new' }
        format.json { render json: @materiallink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materiallinks/1
  # PATCH/PUT /materiallinks/1.json
  def update
    respond_to do |format|
      if @materiallink.update(materiallink_params)
        format.html { redirect_to @materiallink, notice: 'Materiallink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @materiallink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materiallinks/1
  # DELETE /materiallinks/1.json
  def destroy
    @materiallink.destroy
    respond_to do |format|
      format.html { redirect_to materiallinks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materiallink
      @materiallink = Materiallink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materiallink_params
      params.require(:materiallink).permit(:title, :link, :user_id)
    end
end
