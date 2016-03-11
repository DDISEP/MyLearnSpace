class MaterialdocumentsController < ApplicationController
  before_action :set_materialdocument, only: [:show, :edit, :update, :destroy]

  # GET /materialdocuments
  # GET /materialdocuments.json
  def index
    @materialdocuments = Materialdocument.all
    @current_user = User.find(session[:current_user_id])
    @user = User.all
  end

  # GET /materialdocuments/1
  # GET /materialdocuments/1.json
  def show
    @user_author = User.find_by_id(@materialdocument.user_id)
    @user_author_name = @user_author.username
  end

  # GET /materialdocuments/new
  def new
    @materialdocument = Materialdocument.new
  end

  # GET /materialdocuments/1/edit
  def edit
  end

  # POST /materialdocuments
  # POST /materialdocuments.json
  def create
    @materialdocument = Materialdocument.new(materialdocument_params)
    @materialdocument.user_id = @current_user.id

    respond_to do |format|
      if @materialdocument.save
        format.html { redirect_to @materialdocument, notice: 'Das Dokument wurde erfolgreich erstellt!' }
        format.json { render action: 'show', status: :created, location: @materialdocument }
      else
        format.html { render action: 'new' }
        format.json { render json: @materialdocument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materialdocuments/1
  # PATCH/PUT /materialdocuments/1.json
  def update
    @current_user = User.find(session[:current_user_id])
    @user_author = User.find_by_id(@materialdocument.user_id)

    if @user_author.id == @current_user.id
      respond_to do |format|
        if @materialdocument.update(materialdocument_params)
          format.html { redirect_to @materialdocument, notice: 'Das Dokument wurde erfolgreich bearbeitet!' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @materialdocument.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @materialdocument, notice: 'Nur der Autor darf seine Materialien bearbeiten!' }
        #format.js {render js: "alert('Nur Autoren dürfen ihre Materialien bearbeiten!');"}
        format.html {render text: "Nur der Autor darf seine Materialien bearbeiten!"}
      end
    end
  end

  # DELETE /materialdocuments/1
  # DELETE /materialdocuments/1.json
  def destroy
    @current_user = User.find(session[:current_user_id])
    @user_author = User.find_by_id(@materialdocument.user_id)

    if (@user_author.id == @current_user.id) || @current_user.admin?
      @materialdocument.destroy
      respond_to do |format|
        format.html { redirect_to materials_url, notice: 'Das Dokument wurde erfolgreich gelöscht!' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @materialdocument, notice: 'Nur der Autor oder ein Admin dürfen Materialien löschen!' }
        #format.js {render js: "alert('Nur Autoren dürfen ihre Materialien bearbeiten!');"}
        format.html {render text: "Nur der Autor oder ein Admin dürfen Materialien löschen!"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materialdocument
      @materialdocument = Materialdocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materialdocument_params
      params.require(:materialdocument).permit(:title, :file, :user_id)
    end
end
