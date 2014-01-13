class WikisController < ApplicationController
  def new
    @wiki = Wiki.new
    
  end

  #render text: params[:wiki][:tags]

#http://ruby-auf-schienen.de/3.2/ar-many_to_many.html
def create
 
 @wiki = Wiki.new(wiki_params)
 @wiki.clicks= 0
 
 @wiki.addTags(params[:wiki][:tags])
  if @wiki.save      
    redirect_to @wiki
    
  else
    render 'new'
    
    
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
def update2 # funktioniert noch nicht mit Tags
        
  @wiki = Wiki.find(params[:id])
    
  a = params[:wiki][:tags].split(',')
  render text: a[1].strip
  
end
def update # funktioniert noch nicht mit Tags
        
  @wiki = Wiki.find(params[:id])
  @wiki.addTags(params[:wiki][:tags])
  
  #if @wiki.update(params.require(:wiki).permit(:article)) # nur Artikel änderbar
  if @wiki.update(wiki_params)
    
  
  
    redirect_to @wiki
  else
    render 'edit'
  end

  
end
def searchSuggestions
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
