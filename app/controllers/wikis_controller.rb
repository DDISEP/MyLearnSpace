class WikisController < ApplicationController
   before_action :get_tags
   skip_filter :verify_authenticity_token, :search, :destroy
   
  
   
  def new
    @wiki = Wiki.new
    
  end
  
def get_tags # für Suche mit Tags nötig
  @contents = Content.all
end


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
  search_input = params[:search].split('-')
  @wikis = Wiki.searchSuggestions search_input[0]
  @results= ""
  @wikis.each do |wiki|
       @results += wiki.title + "\n"   
  end
  
respond_to do |format|
    format.js do
      if search_input[1] == "article"
        render(:js => "renderLinkSuggests(#{@results.to_json});")
      else
        render(:js => "renderSearchSuggests(#{@results.to_json});")
      end
      end
    format.html { render "wiki404" } # rendert: Fehler 404 (Diese Seite existiert nicht...)
end
  
end

def search
  @query = params[:search]
  @tags =[]
    
  if params[:contents].nil?
    @wiki =  Wiki.find_by_title params[:search]
    if @wiki.nil?
      @wikis = Wiki.search params[:search]
      render "search_results" 
    else 
       render js: "window.location.href = '"+wiki_path(@wiki)+"';"  # entspricht redirect_to @wiki
    end
  else
      params[:contents].each do |content|
      @tags << Content.find(content).tag
    end
    @wikis = Wiki.find_by_tags(params[:contents], params[:search])
    render "search_results" 
  end
end 

  
def show 
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
if session[:admin].nil?
  respond_to do |format|
      format.js {render js: "alert('Nur Administratoren duerfen Artikel loeschen!');"}
      format.html {render text: "Nur Administratoren duerfen Dateien loeschen!"}
    end  
else
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
   
    respond_to do |format|
      format.js { render js: "alert('Artikel geloescht!');window.location.href = '"+wikis_path+"';" }
      format.html {index}
    end  
  
end

end
private 
  def wiki_params
    params.require(:wiki).permit(:title, :article)
  end


end
