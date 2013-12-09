class UsersController < ApplicationController
  
  def index
    @users = User.all #hier muss jeweils noch authorisiert werden, wer sich das ausgeben lassen darf
  end
  
  def new
     
     @user = User.new
    
    #=begin @fehlerName = false
    #@fehlerMail = false
    #@fehlerPasswort1 = false
    #@fehlerPasswort2 = false
    #@fehlerPasswoerterUngleich = false
    #@fehlerNameExistiert = false

    #if params[:name] == nil
     # @fehlerName = true
      #redirect_to(:action => 'profile')
    #end
    #if params[:mail] == nil
    #  @fehlerMail = true
      #redirect_to(:action => 'newError')
    #if params[:pass1] == nil
     # @fehlerPasswort1 = true
      #redirect_to(:action => 'newError')
    #end
    #if params[:pass2] == nil
     # @fehlerPasswort2 = true
      #redirect_to(:action => 'newError')
    #end
    #if params[:pass1] != params[:pass2]
     # @fehlerPasswoerterUngleich = true
      #redirect_to(:action => 'newError')
    #end
    #elsif params[:name] 
      #@fehlerNameExistiert = true
      #redirect_to(:action => 'newError')
    #end
    #=end  
  end
  


  
  def login
    @fehler1 = false
    @fehler2 = false
    if params[:name] != nil
      if User.find_by_username(params[:name]) == nil #Namen gibt es nicht
        @fehler1 = true
        #evtl.: redirect_to(:action => 'login')???
      elsif User.find_by_username(params[:name]).password == params[:pass] #passwort richtig
        session[:name]=params[:name]
        redirect_to(:action => 'profile')
      else
        @fehler2 = true #passwort falsch
        # evtl.: redirect_to(:action => 'login')?????
      end
    end
  end
  
  def logout
    
  end
  
  def profile #nur zugriff möglich, wenn schon eigens profil
    if params[:logout] != nil
      session[:name] = nil
      redirect_to(:action => 'login')
    end
    
    @fehler = false
    if session[:name] == nil
      @fehler = true
    else
      @session = session[:name]
    end
  end
  
  def create
     @user = User.new(params[:user])
       if @user.save
         redirect_to root_url, :notice => "Erfolgreich angemeldet!"
       else
         render "new.html.erb"
       end
  end

  def show #fremde profile
    #@user=User.find(params[:id]) #wenn username in session gleich gesuchtemusername ,dann profile
  end

  def showByName 
    @user=User.find_by_username(params[:username])
    if @user.nil?
      render "showEmptyUser.html.erb"
    else
      render "show.html.erb"
    end
  end
  
  def edit
    
  end 

  def update
    
  end

  def destroy
    u=User.find(params[:id])
    u.destroy
    @users = User.all
    render :action => :index
  end

  #def authenticate 
     #user = User.find_by_email(params[:email])
     #if user && user.authenticate(params[:password])
    #end 
  #end

end
