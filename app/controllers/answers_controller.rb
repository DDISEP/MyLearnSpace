class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
    @current_user = User.find(session[:current_user_id])
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new

    @current_user  = User.find(session[:current_user_id])

    @question_id = params[:question_id]
    @question = Question.find_by_id(@question_id)

    @answer.user_id = @current_user.id
    @answer.question_id = @question.id
    @answer.text = params[:text]

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Die Antwort wurde erfolgreich erstellt.' }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    @answer.user_id = @current_user.id

    @answer.question_id = params[:id]


    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    if @current_user.id == @answer.user_id
      respond_to do |format|
        if @answer.update(answer_params)
          format.html { redirect_to @answer.question, notice: 'Die Antwort wurde erfolgreich bearbeitet!' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @answer.question, notice: 'Nur der Autor darf seine Antworten bearbeiten!' }
        format.html {render text: "Nur der Autor darf seine Antworten bearbeiten"}
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    if (@current_user.id == @answer.user_id) || @current_user.admin?
      @answer.destroy
      respond_to do |format|
        format.html { redirect_to questions_url, notice: 'Die Antwort wurde erfolgreich gelöscht!' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to questions_url, notice: 'Nur der Autor oder ein Admin dürfen Antworten löschen!' }
        format.html {render text: "Nur der Autor oder ein Admin dürfen Antworten löschen!"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:text, :user_id, :question_id)
    end
end
