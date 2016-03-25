class SolutionsController < ApplicationController

  def index

  end

  #def initialize (solution, description, subexercise)
  #    @solution = solution
  #    @description = description
  #    @subexercise = Subexercise.find(subexercise)
  #end

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
    @solution.solution = params[:subexercise][:solution]
    @solution.description = params[:subexercise][:description]
    @subexercise.save
    flash[:notice] = "Teilaufgabe erfolgreich geaendert."
    redirect_to edit_exercise_path(params[:exercise_id])
  end

end
