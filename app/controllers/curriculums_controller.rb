class CurriculumsController < ApplicationController
  
#  before_filter :check_auth, :only => [:edit, :update, :destroy] #evtl mehrere eintragen
  
#  def check_auth
#    if session[:user_id] != @curriculum.user_id
#     flash[notice] = "Sie haben keine Zugriffsrechte auf die Lehrpläne!"
#      redirect_to curriculums_path
#    end
#  end

#private  
#  def curriculum_params
#    params.require(:curriculum).permit(:country, :state, :level, :typeOfSchool, :subject, :profession)
#  end

  
#  before_filter :show, :only => [:edit, :update, :destroy]  
  
  def index
    @curriculums = Curriculum.all 
  end
  
  
  def show
   @curriculum = Curriculum.find(params[:id])
  end
  
  
  def new
    @curriculum = Curriculum.new
  end
  
  
  def create
    #render text: params[:curriculum].inspect #gibt Parameter als Text aus
    @curriculum = Curriculum.new(params[:curriculum])
    if @curriculum.save
      redirect_to @curriculum
    else
     render 'new'
    end
  end


  def edit
    @curriculum = Curriculum.find(params[:id])
  end


  def update
    @curriculum = Curriculum.find(params[:id])
    @curriculum.update_attributes(params[:curriculum])
    redirect_to @curriculum
  end
  
  
  def destroy
    @curriculum = Curriculum.find(params[:id])
    @curriculum.destroy
    redirect_to curriculums_path
  end
  
end