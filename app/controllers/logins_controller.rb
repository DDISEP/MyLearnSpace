#Encoding: utf-8
class LoginsController < ApplicationController
  # "Create" a login, aka "log the user in"
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_login, only: [:show, :edit, :update, :destroy]

  # GET /logins
  # GET /logins.json
  def index
    @logins = Login.all
  end

  # GET /logins/1
  # GET /logins/1.json
  def show
  end

  # GET /logins/new
  def new
    @login = Login.new
  end

  # GET /logins/1/edit
  def edit
  end

  # POST /logins
  # POST /logins.json
  def create
    user = User.authenticate params[:email], params[:password]
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Willkommen zurück, ' + user.username + '!'
    else
      flash[:notice] = "Bitte gib deine Benutzerdaten ein."
      render 'new'
    end
    

    #@login = Login.new(login_params)

    #respond_to do |format|
      #if @login.save
        #format.html { redirect_to @login, notice: 'Login was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @login }
      #else
        #format.html { render action: 'new' }
        #format.json { render json: @login.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /logins/1
  # PATCH/PUT /logins/1.json
  def update
    respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to @login, notice: 'Login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1
  # DELETE /logins/1.json
  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "Erfolgreich abgemeldet!"
    redirect_to root_url
    #@login.destroy
    #respond_to do |format|
      #format.html { redirect_to logins_url }
      #format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login
      @login = Login.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params[:login]
    end
end
