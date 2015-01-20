class ExerciseContentsController < ApplicationController
  
  before_action :get_exercise, only: [:new, :destroy]
  
  def get_exercise
    @xercisee = Task.find(params[:exercise_id])
  end
  
  def new
    newlike = Like.new
    newlike.exercise = @task
    newlike.user = User.find(session[:current_user_id])
    newlike.save
    redirect_to @task
  end
 
  def destroy
    l = Like.find(params[:id])
    l.destroy
    redirect_to @task
  end
  
end
