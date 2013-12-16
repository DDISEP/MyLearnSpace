class CurriculumsController < ApplicationController
  
  before_filter :get_curriculum, :only => [:edit, :update, :destroy]
#  before_filter :check_auth, :only => [:edit, :update, :destroy] #evtl mehrere eintragen
  
  def get_curriculum
    @curriculum = Curriculum.find(params[:id])
  end
  
#  def check_auth
#    if session[:user_id] != @curriculum.user_id
#     flash[notice] = "Sie haben keine Zugriffsrechte auf die Lehrpläne!"
#      redirect_to curriculums_path
#    end
#  end
  
  def index
    @curriculums = Curriculum.all 
  end
  
  def show
    @curriculum = Curriculum.find(params[:id])
  end
  
  def new
    @curriculum = Curriculum.new
  end
  
 # def edit
    
 # end
  
  def create
    @curriculums = Curriculum.create
  end
  
  #def update
    
  #end
  
  #def destroy
    
 # end
end