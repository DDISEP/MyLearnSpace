class ExerciseContentsController < ApplicationController
  
  before_action :get_exercise, only: [:new, :destroy]
  
  def get_exercise
    @xercisee = Exercise.find(params[:exercise_id])
  end
  
  def new
    newlike = Like.new
    newlike.exercise = @exercise
    newlike.user = User.find(session[:current_user_id])
    newlike.save
    redirect_to @exercise
  end
 
  def destroy
    l = Like.find(params[:id])
    l.destroy
    redirect_to @exercise
  end
  
end
