class AssessmentContentsController < ApplicationController
  before_action :get_assessment, only: [:new, :destroy]

  def get_assessment
    @assessment = Assessment.find(params[:assessment_id])
  end

  def new
    newlike = Like.new
    newlike.assessment = @assessment
    newlike.user = User.find(session[:current_user_id])
    newlike.save
    redirect_to @assessment
  end

  def destroy
    l = Like.find(params[:id])
    l.destroy
    redirect_to @assessment
  end

end
