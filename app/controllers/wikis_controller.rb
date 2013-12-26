class WikisController < ApplicationController
  def new
    @wiki = Wiki.new
    
  end


def create
  
 @wiki = Wiki.new(wiki_params)
 @wiki.clicks= 0
 
  if @wiki.save
    redirect_to @wiki
    
  else
    render 'new'
    #render text: "else"
    
  end
  
end
def edit
  @wiki = Wiki.find(params[:id])
  @title = @wiki.title
  
  
end

def update
        
  @wiki = Wiki.find(params[:id])
 
  if @wiki.update(params.require(:wiki).permit(:article)) # nur Artikel änderbar
  #if @wiki.update(wiki_params)
    redirect_to @wiki
  else
    render 'edit'
  end

  
end
def searchSuggestions
  @wikis = Wiki.searchSuggestions params[:search]
  @results= ""
  @wikis.each do |wiki|
       #results += "<div onmouseover=\"javascript:suggestOver(this); " 
       #resulst += "onmouseout=\"javascript:suggestOut(this);\" " 
       #results += "class=\"suggest_link\">"
       #results += link_to wiki.title, wiki_path(wiki)
       #results += "</div>"
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
      
  else # Refactoring -> Id an findByNames übergeben und findBynames aufrufen  
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
  @wiki = Wiki.find_by_clicks(Wiki.maximum("clicks")) #beliebtestes Wiki
 
  
end

private 
  def wiki_params
    params.require(:wiki).permit(:title, :article)
  end


end
