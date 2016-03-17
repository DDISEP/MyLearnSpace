class SolutionsController < ApplicationController

  def index

  end

  def edit

  end

  def new
    @solution = Solution.new
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
