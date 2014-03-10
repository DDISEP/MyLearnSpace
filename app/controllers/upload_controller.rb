class UploadController < ApplicationController
  skip_filter :verify_authenticity_token, :destroy
  def index
     
   @files = DataFile.all
   render "index" 
  
  end

def new
  
end

def create
  
   @post = DataFile.save(params[:file])
   if @post
     @file = DataFile.last
   end
   render "fileSaved"      
end

def show
  @file = DataFile.find(params[:id]) 
  
end
def destroy
  if session[:admin].nil?
    respond_to do |format|
      format.js {render js: "alert('Nur Amdins duerfen Dateien loeschen!');"}
      format.html {render text: "Nur Administratoren duerfen Dateien loeschen!"}
    end  
  else  
    @id = params[:id].to_i
    @file = DataFile.find(params[:id])
    if File.exist?(Rails.root.join('public', 'uploads', @file.getStorableName))
      File.delete(Rails.root.join('public', 'uploads', @file.getStorableName))
    end
    @file.destroy
    respond_to do |format|
      format.js {render "destroy.js.erb"}
      format.html {index}
    end
  end
end
  
end