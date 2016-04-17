require 'will_paginate/array'

class ExercisesController < ApplicationController
  
  before_action :get_exercise, only: [:show, :edit, :delete, :destroy, :update, :get_comments, :start, :authenticate, :finish, :statistics]
  before_action :get_comments, only: [:destroy, :delete, :show]
  before_action :get_latest_performance, only: [:show, :start]
  before_action :check_auth, only:[:update, :destroy]
  
  def check_auth
    if @exercise.user_id != session[:current_user_id] && session[:admin] != true then
      flash[:notice] = "Du bist weder Administrator, noch Autor deser Lernaufgabe!"
      redirect_to @exercise
    end
  end
  
  def get_latest_performance
    #@latest_performance = Performance.where(exercise_id: params[:id], user_id: session[:current_user_id]).order('updated_at DESC').first
  end
  
  def get_exercise
    @exercise = Exercise.find(params[:id])
  end
  
  def get_comments
    @comments = Comment.where(exercise_id: @exercise.id).order('created_at DESC')
  end

  def get_likes
      @likes = Like.where(exercise_id: @exercise.id)
  end
  
  def index
    case params[:sort_by]       # you can add other cases when new sort options are implemented in _list_exercises.html.erb
    when "created_at"
      @exercises = Exercise.all.order('created_at')
    when "created_at DESC"
      @exercises = Exercise.all.order('created_at DESC')
    when "like_counter"
      @exercises = Exercise.all.sort_by{|e| e.like_counter}
    when "like_counter DESC"
      @exercises = Exercise.all.sort_by{|e| e.like_counter}.reverse
    when "title"
      @exercises = Exercise.all.order('title')
    when "title DESC"
      @exercises = Exercise.all.order('title DESC')
    when "author_name"
      @exercises = Exercise.all.sort_by{|e| e.author_name.downcase}           # need to downcase to assure right order
    when "author_name DESC"
      @exercises = Exercise.all.sort_by{|e| e.author_name.downcase}.reverse
    else        # created_at DESC as default order
      puts "Undefined sort_by option"
      @exercises = Exercise.all.order('created_at DESC')
    end
    
    @top_exercise = @exercises.sort_by{|e| e.like_counter }.last    # important: find top_exercise before calling paginate!
    
    @exercises = @exercises.paginate(:page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.js
      format.html
    end
     
  end

  def show
    session[:exercise_id] = @exercise.id
    #if @latest_performance != nil && @latest_performance.current_position > -1 then
      #last performance unfinished, set next subexercise to do
    #  @next = Subexercise.where(exercise_id: params[:id], position: @latest_performance.current_position).first
    #end
    @comment = Comment.new      # needed for comment/_form.html.erb
    @existingLike = Like.where(exercise_id: params[:id], user_id: session[:current_user_id]).first #check, if user already likes this exercise
    @comments = @comments.paginate(:page => params[:page], :per_page => 10)
    @page = params[:page].nil? ? 1 : params[:page]
    @top_performance = Performance.where(user_id: session[:current_user_id]).order('achieved_points DESC').first
  end

  def edit  # even admin isn't allowed to edit exercises, he/she may only delete it
    if @exercise.user_id != session[:current_user_id] && !User.find(session[:current_user_id]).admin && !User.find(session[:current_user_id]).admin then
      flash[:notice] = "Nur der Autor einer Aufgabe darf diese aendern!"
      redirect_to @exercise
    end
    @subexercises = @exercise.subexercises
  end

  def new
    @exercise = Exercise.new
  end
  
  def create
    @exercise = Exercise.new
    @exercise.title = params[:exercise][:title]
    @exercise.description = params[:exercise][:description]
    @exercise.knowledge_element_id = (params[:exercise][:knowledge_element_id]).to_i
    @exercise.knowledge_element = KnowledgeElement.find(@exercise.knowledge_element_id)
    @exercise.user_id = session[:current_user_id]
    @exercise.sequence = TRUE
    if User.find(session[:current_user_id]).admin == :true then
      @exercise.moderated = TRUE
    elsif User.find(session[:current_user_id]).teacher == :true then
       @exercise.moderated = TRUE
    else
      @exercise.moderated = FALSE
    end
    @exercise.save      # exercises created and saved
    flash[:notice] = "Aufgabe erfolgreich angelegt"
    redirect_to exercise_path(@exercise)
  end
  
  def update
    @exercise.title = params[:exercise][:title]
    @exercise.description = params[:exercise][:description]
    @exercise.save

    flash[:notice] = "Aufgabe erfolgreich bearbeitet!"
    redirect_to exercise_path(@exercise)
  end
  
  def start
    if Subexercise.where(exercise_id: @exercise).count == 0 then
      redirect_to(exercise_path(@exercise), notice: "Keine Teilaufgaben vorhanden!")
    else
      random = rand(Subexercise.where(exercise_id: @exercise.id).count).to_i
      firstQuestion = Subexercise.where(exercise_id: @exercise.id).to_a.at(random)
      #order('position ASC').first   # first question doens't have to have position 0
      #@performance = Performance.new          # for some (unknown) reason mass assignment via create didn't work
      #@performance.exercise_id = params[:id]
      #@performance.user_id = session[:current_user_id]
      #@performance.current_position = firstQuestion.position
      #@performance.achieved_points = 0
      #@performance.max_points = @exercise.max_points
      #@performance.save
      redirect_to new_subexercise_performance_path(firstQuestion)
    end
  end
  
  def finish

  end
  
  def destroy
    @exercise.destroy
    flash[:notice] = "Aufgabe erfolgreich geloescht!"
    #redirect_to exercises_path #Eine Aufgabe wird nicht gelöscht, sondern nicht angezeigt, falls es keine Unteraufgabe (subexercises gibt)
    #Zum Löschen einer Exercise werden alle Subexercises gelöscht
    for aufgabe in @subexercieses = Subexercises.where(exercises_id: param[id])
      aufgabe.destroy
    end
  end
  
  def search
    @matching_exercises = []
    if params[:search_style] == "tags" then
      tags_to_search = params[:input_tags].split(',').map{|t| t.strip.downcase}   # stores all entered words downcased
      ExerciseContent.all.each do  |l|
        if tags_to_search.include?(l.content.tag.downcase) then       # check for each existing link if its tag has eben entered
          @matching_exercises.push(l.exercise)                        # if yes, add corresponding exercises to matching_exercises
        end  
      end
    elsif params[:search_style] == "title" then
      input_title = params[:input_title].downcase                           # downcase input title to account for simple typos
      Exercise.all.each do |e|
        e_title = e.title.downcase                                          # downcase title to account for simple typos
        if e_title.match(input_title) || input_title.match(e_title) then    # check for each exercise if its title in
          @matching_exercises.push(e)
        end
      end
    else
       # TODO redirect to error page for other search_styles
    end
    @matching_exercises = @matching_exercises.paginate(:page => params[:page], :per_page => 10)
    
  end
  
  def change_search_style
    @search_style = params[:search_style]
    respond_to do |format|
      format.js
    end
  end
  
  def statistics
    #@performances = Performance.where(exercise_id: params[:id], user_id: session[:current_user_id], current_position: -2).order('created_at DESC')
  end

  def update_subnumbers
    if @exercises.sequence = true
      #hier muss manuell sortiert bzw. bestätigt werden!
    else
      #hier wird automatisch aufgerückt
      int temp = 1
      for aufgabe in @subexercises = Subexercises.where(active: true, exercises_id: params[id]).order('position') do
        aufgabe.setNumber = temp
        temp = temp + 1
      end
    end
  end


end
