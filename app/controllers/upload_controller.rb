class UploadController < ApplicationController
  def index
     
   @files = DataFile.all
   render "index" 
  
  end

def new
  
end

def create
  
   @post = DataFile.save(params[:file])
   if @post
    #@filename = params[:file].original_filename
    @file = DataFile.last
   end
   render "fileSaved"      # data:remote funktioniert irgendwie nur im Wiki !?
end

def show
  @file = DataFile.find(params[:id]) 
  
end
def destroy
  @id = params[:id].to_i
  @file = DataFile.find(params[:id])
  if File.exist?(Rails.root.join('public', 'uploads', @file.getStorableName))
    File.delete(Rails.root.join('public', 'uploads', @file.getStorableName))
  end
  @file.destroy
     #TODO: JS Respond
  #render "index"
  respond_to do |format|
      format.js
    end
end
  
  
end