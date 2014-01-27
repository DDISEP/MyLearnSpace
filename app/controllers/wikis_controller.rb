class WikisController < ApplicationController
  def new
    @wiki = Wiki.new
    
  end

  #render text: params[:wiki][:tags]


def create 
    @wiki = Wiki.new(wiki_params)
    @wiki.clicks= 0
    if @wiki.save   
      @tags = @wiki.searchArticleForTags
      render "displaySuggestedTags"
    else
      render "displayErrors"
    end 
  
end

def edit
  if Wiki.exists?(params[:id])
    @wiki = Wiki.find(params[:id]) 
      
  else   
    title = params[:id].gsub('_',' ') # Unterstriche in Links in Leerzeichen umwandeln    
    @wiki= Wiki.find_by_title(title)
  end    
  @title = @wiki.title  
end

def update 
  @wiki = Wiki.find(params[:id])
    
  if !params[:wiki][:title].nil? # -> 1. Seite von der Form
    if @wiki.update(wiki_params)    
      @tags = @wiki.searchArticleForTags
      render "displaySuggestedTags"
    else
      render "displayErrors"
    end
  else                           # -> 2. Seite von der Form
    @wiki.setTags(params[:wiki][:tags])
      if @wiki.errors.any?
        render "displayErrors"
      else
         render js: "window.location.href = '"+wiki_path(@wiki)+"';"  # entspricht redirect_to @wiki
      end
        
  end
end



def searchSuggestions  # TODO Route in Index integrieren -> searchSUggestions soll ausgeführt werden wenn index mit JS aufgerufen wird
  @wikis = Wiki.searchSuggestions params[:search]
  @results= ""
  @wikis.each do |wiki|
       @results += wiki.title + "\n"   
  end
  
respond_to do |format|
    format.js do
      render(:js => "renderSearchSuggests(#{@results.to_json});")
      end
#    format.html { render text: "Diese Seite existiert nicht" }
format.html { render "wiki404" }
end
  
end

def search
  @wikis = Wiki.search params[:search]
  render "search_results" 
  
end
  
def show #TODO: Auslagern in Model
  @title=""
  if Wiki.exists?(params[:id])
    @wiki = Wiki.find(params[:id]) 
      
  else   
    @title = params[:id].gsub('_',' ') # Unterstriche in Links in Leerzeichen umwandeln    
    @wiki= Wiki.find_by_title(@title)
  end    
  if @wiki.nil? # Test ob Wiki-Artikel mit disem Titel schon vorhanden
    @wiki = Wiki.new
    render "showEmptyArticle.html.erb" # Falls es noch keinen gibt
  else
    @wiki.increment(:clicks, by = 1)
    @wiki.save
    render "show.html.erb"
    
  end   
  
   
end



def index
  
  @popArticle = Wiki.find_by_clicks(Wiki.maximum("clicks")) #beliebtestes Artikel
  @newestArticle = Wiki.last # neuester Artikel
 
  
end
def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
    redirect_to wikis_path
  end
private 
  def wiki_params
    params.require(:wiki).permit(:title, :article)
  end


end
