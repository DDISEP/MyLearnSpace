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
def showByName # Aufruf wiki/[Artikelname] möglich z.B. : wiki/Wurzel 
  @wiki= Wiki.find_by_title(params[:title])
  if @wiki.nil? # Test ob Wiki-Artikel mit disem Titel schon vorhanden
    @title = params[:title]
    render "showEmptyArticle.html.erb" # Falls es noch keinen gibt
  else
    render "show.html.erb" 
  end
  
end
def index
  @wikis = Wiki.all
end
private
  def wiki_params
    params.require(:wiki).permit(:title, :article)
  end
end


