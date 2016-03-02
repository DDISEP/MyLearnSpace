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
    @user_author_id = User.find_by_id(@materialtext.user_id)
    @user_author_name = @user_author_id.username
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
        format.html { redirect_to @materialtext, notice: 'Materialtext was successfully created.' }
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
    respond_to do |format|
      if @materialtext.update(materialtext_params)
        format.html { redirect_to @materialtext, notice: 'Materialtext was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @materialtext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materialtexts/1
  # DELETE /materialtexts/1.json
  def destroy
    @materialtext.destroy
    respond_to do |format|
      format.html { redirect_to materialtexts_url }
      format.json { head :no_content }
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
