class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    @current_user = User.find(session[:current_user_id])
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answers = @question.answers
    @answer = Answer.new
    @answer.question = @question
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_name = @current_user.username

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Deine Frage wurde ins Forum aufgenommen.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if @current_user.id == User.find_by_username(@question.user_name).id
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to @question, notice: 'Die Frage wurde erfolgreich bearbeitet!' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @question, notice: 'Nur der Autor darf seine Fragen bearbeiten!' }
        format.html {render text: "Nur der Autor darf seine Fragen bearbeiten"}
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    if (@current_user.id == User.find_by_username(@question.user_name).id) || @current_user.admin?
      @question.destroy
      respond_to do |format|
        format.html { redirect_to questions_url, notice: 'Die Frage wurde erfolgreich gelöscht!' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @question, notice: 'Nur der Autor oder ein Admin dürfen Fragen löschen!' }
        format.html {render text: "Nur der Autor oder ein Admin dürfen Fragen löschen!"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :text)
    end
end
