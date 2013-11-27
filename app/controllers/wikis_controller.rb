class WikisController < ApplicationController
  def new
    @wiki = Wiki.new
  end
  
def create
  @wiki = Wiki.new(wiki_params)
  
  if @wiki.save
    redirect_to @wiki
  else
    render 'new'
  end
  
end

def search
  @wikis = Wiki.search params[:search]
 
 render "search_results" # Todo partial Render implementieren, so dass Ergebnisse in aktuelle Seite eingebunden werden; Vll ist das Problem dass @wikis doppelt verwendet wird
 #render :partial => "search_results"
  
  
end
  
def show
  @title=""
  if Wiki.exists?(params[:id])
    @wiki = Wiki.find(params[:id])   
  else # Refactoring -> Id an findByNames übergeben und findBynames aufrufen  
    @title = params[:id]
    @wiki= Wiki.find_by_title(@title)
  if @wiki.nil? # Test ob Wiki-Artikel mit disem Titel schon vorhanden
    render "showEmptyArticle.html.erb" # Falls es noch keinen gibt
  else
    render "show.html.erb" 
  end   
  end
   
end

def showByName # Aufruf wiki/[Artikelname] möglich z.B. : wiki/Wurzel 

  @title= params[:title]
  @wiki= Wiki.find_by_title(@title)
  if @wiki.nil? # Test ob Wiki-Artikel mit disem Titel schon vorhanden
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
