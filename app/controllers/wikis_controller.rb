class WikisController < ApplicationController
  def new
    @wiki = Wiki.new
    
  end


def create
  
 @wiki = Wiki.new(params[:wiki])
 
  if @wiki.save
    redirect_to @wiki
    
  else
    render 'new'
    #render text: "else"
    
  end
  
end
def edit
  @wiki = Wiki.find(params[:id])
end

def update
        
  @wiki = Wiki.find(params[:id])
 
  if @wiki.update(params.require(:wiki).permit(:article)) # nur Artikel änderbar
    redirect_to @wiki
  else
    render 'edit'
  end

  
end


def search
  @wikis = Wiki.search params[:search]
 
 render "search_results" 
  
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
