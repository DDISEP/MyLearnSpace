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
    @latest_performance = Performance.where(exercise_id: params[:id], user_id: session[:current_user_id]).order('updated_at DESC').first
  end
  
  def get_exercise
    @exercise = Exercise.find(params[:id])
  end
  
  def get_comments
    @comments = Comment.where(exercise_id: @exercise.id).order('created_at DESC')
  end
  
  def index
    case params[:sort_by]       # you can add other cases when new sort options are implemented in _list_assessments.html.erb
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
    if @latest_performance != nil && @latest_performance.current_position > -1 then
      #last performance unfinished, set next subexercise to do
      @next = Subexercise.where(exercise_id: params[:id], position: @latest_performance.current_position).first 
    end
    @comment = Comment.new      # needed for comment/_form.html.erb
    @existingLike = Like.where(exercise_id: params[:id], user_id: session[:current_user_id]).first #check, if user already likes this exercise
    @comments = @comments.paginate(:page => params[:page], :per_page => 10)
    @page = params[:page].nil? ? 1 : params[:page]
    @top_performance = Performance.where(exercise_id: @exercise.id, user_id: session[:current_user_id]).order('achieved_points DESC').first
  end

  def edit  # even admin isn't allowed to edit exercises, he/she may only delete it
    if @exercise.user_id != session[:current_user_id] then
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
    @exercise.user_id = session[:current_user_id]
    @exercise.save      # exercises created and saved
    tags = params[:tags].split(",").map{|tag| tag.strip }
    tags.each do |t|
      # attention: works only with SQLite!
      matching_tag = KnowledgeElement.find_by_sql("SELECT * FROM knowledge_elements WHERE tag = '" + t + "' COLLATE NOCASE;").first
      if matching_tag != nil then
        to_create = ExerciseContent.new
        to_create.exercise_id = @exercise.id
        to_create.knowledge_element_id = matching_tag.id
        to_create.save   
      end
    end     # links between exercise and knowledge_elements created and saved
    flash[:notice] = "Aufgabe erfolgreich angelegt"
    redirect_to exercise_path(@exercise)
  end
  
  def update
    @exercise.title = params[:exercise][:title]
    @exercise.description = params[:exercise][:description]
    @exercise.save
    
    old_tags = @exercise.knowledge_elements.map{|t| t.tag}                # tags as they were before editing
    new_tags = params[:tags].split(",").map{|tag| tag.strip }   # tags that have now been entered
    tags_to_create = new_tags - old_tags                        # tags that now have to be created
    tags_to_delete = old_tags - new_tags                        # tags that now have to be removed
    
    tags_to_delete.each do |t|
      # matching_tag = KnowledgeElement.where(tag: t).first
      # attention: wors only with SQLite!
      matching_tag = KnowledgeElement.find_by_sql("SELECT * FROM knowledge_elements WHERE tag = '" + t + "' COLLATE NOCASE;").first
      matching_link = matching_tag.nil? ? nil : ExerciseContent.where(knowledge_element_id: matching_tag.id, exercise_id: @exercise.id).first
                                      # should never be nil because link already existed, check just for security
      if matching_link != nil then    # should also never be nil because link already existed, check just for security
        matching_link.destroy
      end
    end     # deleted all tags that aren't enumerated anymore
    
    tags_to_create.each do |t|
      # attention: wors only with SQLite!
      matching_tag = KnowledgeElement.find_by_sql("SELECT * FROM knowledge_elements WHERE tag = '" + t + "' COLLATE NOCASE;").first
      if matching_tag != nil then
        to_create = ExerciseContent.new
        to_create.exercise_id = @exercise.id
        to_create.knowledge_element_id = matching_tag.id
        to_create.save
      end
    end       # created the newly entered tags
    flash[:notice] = "Aufgabe erfolgreich bearbeitet!"
    redirect_to exercise_path(@exercise)
  end
  
  def start
    if @exercise.subexercise_counter == 0 then
      redirect_to(exercise_path(@exercise), notice: "Keine Teilaufgaben vorhanden!")
    else
      firstQuestion = Subexercise.where(exercise_id: @exercise.id).order('position ASC').first   # first question doens't have to have position 0
      @performance = Performance.new          # for some (unknown) reason mass assignment via create didn't work
      @performance.exercise_id = params[:id]
      @performance.user_id = session[:current_user_id]
      @performance.current_position = firstQuestion.position
      @performance.achieved_points = 0
      @performance.max_points = @exercise.max_points
      @performance.save
      redirect_to perform_exercise_subexercise_path(@exercise, firstQuestion)
    end
  end
  
  def finish
    @performance = Performance.where(exercise_id: params[:id], user_id: session[:current_user_id]).order('created_at DESC').first
    if @performance.current_position > -2 && params[:given_points] != nil then                    # necessary to prevent multiple adding of points when reloading page
                                                                                                  # params[:given_points} should never be nil, check just for security
        @performance.achieved_points = @performance.achieved_points + params[:given_points].to_i
        puts "HELLO" +  params[:given_points].to_s
    end
    @performance.current_position = -2
    @performance.save
    @performances = Performance.where(exercise_id: params[:id], user_id: session[:current_user_id]).order('created_at DESC')
  end
  
  def destroy
    @exercise.destroy
    flash[:notice] = "Aufgabe erfolgreich geloescht!"
    redirect_to exercises_path
  end
  
  def search
    @matching_exercises = []
    if params[:search_style] == "tags" then
      tags_to_search = params[:input_tags].split(',').map{|t| t.strip.downcase}   # stores all entered words downcased
      ExerciseContent.all.each do  |l|
        if tags_to_search.include?(l.knowledge_element.tag.downcase) then       # check for each existing link if its tag has eben entered
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
    @performances = Performance.where(exercise_id: params[:id], user_id: session[:current_user_id], current_position: -2).order('created_at DESC')
  end

end
