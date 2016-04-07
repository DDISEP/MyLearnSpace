class SolutionsController < ApplicationController

  def index

  end

  def edit

  end

  def new
    @solution = Solution.new
  end

  def create
    @solution = Solution.new
    @solution.solution = params[:solution][:solution]
    @solution.description = params[:solution][:description]
    @solution.subexercise = Subexercise.find((params[:solution][:subexercise_id]).to_i+0)
    @solution.save
    flash[:notice] = "Lösung erfolgreich hinterlegt."
    redirect_to edit_exercise_path(Subexercise.find(params[:solution][:subexercise_id].to_i).exercise)
  end

  def get_subexercise
    return @subexercise
  end

  def update
    Solution.find(params[:id]).solution = params[:solution][:solution]
    Solution.find(params[:id]).description = params[:solution][:description]
    Solution.find(params[:id]).save
    flash[:notice] = "Teilaufgabe erfolgreich geaendert."
    redirect_to exercises_path
  end

end
