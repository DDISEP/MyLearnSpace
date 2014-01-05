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


  
  
end