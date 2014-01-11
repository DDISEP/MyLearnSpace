class UploadController < ApplicationController
  def index
     @file = DataFile.last
     render :partial => 'uploadfile'
  
  
  end

def upload
  
   @post = DataFile.save(params[:file])
   if @post
    #@filename = params[:file].original_filename
    @file = DataFile.last
   end
   render "fileSaved"      # data:remote funktioniert irgendwie nur im Wiki !?
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
  @file = DataFile.find(params[:id])
  File.delete(Rails.root.join('public', 'uploads', @file.getStorableName))
  @file.destroy
  render :partial => "uploadfile"     #TODO: JS Respond
  
  
end
  
  
end