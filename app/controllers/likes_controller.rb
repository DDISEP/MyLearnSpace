class LikesController < ApplicationController
  
  before_action :get_exercise, only: [:new, :destroy]
  
  def get_exercise
    @exercise = Exercise.find(params[:exercise_id])
  end
  
  def new
    newlike = Like.new
    newlike.exercise = @exercise
    newlike.user = User.find(session[:current_user_id])
    newlike.save
    @existingLike = Like.where(exercise_id: @exercise.id, user_id: session[:current_user_id]).first  #check, if user already likes this exercise (should always be the case)
    
  end
 
  def destroy
    Like.find(params[:id]).destroy
    @existingLike = Like.where(exercise_id: @exercise.id, user_id: session[:current_user_id]).first # check, if user already likes this exercise
  end                                                                                               # at this point this should not happen => @existingLike should be nil
                                                                                                   
end
