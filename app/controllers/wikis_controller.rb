class WikisController < ApplicationController
  def new
    
  end
  
def create
  @wiki = Wiki.new(wiki_params)
  @wiki.save
  redirect_to @wiki
end

  
  
def show
  @wiki = Wiki.find(params[:id])
  
  
end
def index
  @wikis = Wiki.all
end
private
  def wiki_params
    params.require(:wiki).permit(:title, :article)
  end
end


