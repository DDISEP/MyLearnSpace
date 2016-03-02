class ExerciseoverviewsController < ApplicationController
  before_action :set_exerciseoverview, only: [:show, :edit, :update, :destroy]

  # GET /exerciseoverviews
  # GET /exerciseoverviews.json
  def index
    @exerciseoverviews = Exerciseoverview.all
  end

  # GET /exerciseoverviews/1
  # GET /exerciseoverviews/1.json
  def show
  end

  # GET /exerciseoverviews/new
  def new
    @exerciseoverview = Exerciseoverview.new
  end

  # GET /exerciseoverviews/1/edit
  def edit
  end

  # POST /exerciseoverviews
  # POST /exerciseoverviews.json
  def create
    @exerciseoverview = Exerciseoverview.new(exerciseoverview_params)

    respond_to do |format|
      if @exerciseoverview.save
        format.html { redirect_to @exerciseoverview, notice: 'Exerciseoverview was successfully created.' }
        format.json { render action: 'show', status: :created, location: @exerciseoverview }
      else
        format.html { render action: 'new' }
        format.json { render json: @exerciseoverview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exerciseoverviews/1
  # PATCH/PUT /exerciseoverviews/1.json
  def update
    respond_to do |format|
      if @exerciseoverview.update(exerciseoverview_params)
        format.html { redirect_to @exerciseoverview, notice: 'Exerciseoverview was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exerciseoverview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exerciseoverviews/1
  # DELETE /exerciseoverviews/1.json
  def destroy
    @exerciseoverview.destroy
    respond_to do |format|
      format.html { redirect_to exerciseoverviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exerciseoverview
      @exerciseoverview = Exerciseoverview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exerciseoverview_params
      params[:exerciseoverview]
    end
end
