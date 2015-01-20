class LikesController < ApplicationController
  
  before_action :get_exercise, only: [:new, :destroy]
  
  def get_exercise
    @task = Task.find(params[:exercise_id])
  end
  
  def new
    newlike = Like.new
    newlike.exercise = @task
    newlike.user = User.find(session[:current_user_id])
    newlike.save
    @existingLike = Like.where(exercise_id: @task.id, user_id: session[:current_user_id]).first  #check, if user already likes this task (should always be the case)
    
  end
 
  def destroy
    Like.find(params[:id]).destroy
    @existingLike = Like.where(exercise_id: @task.id, user_id: session[:current_user_id]).first # check, if user already likes this task
  end                                                                                               # at this point this should not happen => @existingLike should be nil
                                                                                                   
end
