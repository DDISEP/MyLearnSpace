class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find params[:question_id].to_i
    @answer.question = @question
    @answers = @question.answers
    
    if session[:name] == nil
      @answer.user_name = 'Illegaler Antworter'
    else
      @answer.user_name = session[:name]
    end

    if @answer.save
      render
    else
      redirect_to @answer.question, notice: 'Deine Antwort konnte nicht gespeichert werden.'
    end
  end

  private  
    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit :text, :question_id
    end
end
