require 'will_paginate/array'

class AssessmentsController < ApplicationController
  before_action :get_assessment, only: [:show, :edit, :delete, :destroy, :update, :start, :authenticate, :finish, :statistics, :clef, :showclef]
  before_action :get_latest_performance, only: [:show, :start]
  before_action :check_auth, only:[:update, :destroy]
  before_action :authorize_teacher, only:[:create, :new]

  def check_auth
    if @assessment.user_id != session[:current_user_id] && session[:admin] != true then
      flash[:notice] = "Du bist weder Administrator, noch Autor dieser Prüfung!"
      redirect_to @assessment
    end
  end

  def get_latest_performance
    @latest_performance = Performance.where(assessment_id: params[:id], user_id: session[:current_user_id]).order('updated_at DESC').first
  end

  def get_assessment
    @assessment = Assessment.find(params[:id])
  end



  def index
    case params[:sort_by]       # you can add other cases when new sort options are implemented in _list_assessments.html.erb
      when "created_at"
        @assessments = Assessment.all.order('created_at')
      when "created_at DESC"
        @assessments = Assessment.all.order('created_at DESC')
      when "title"
        @assessments = Assessment.all.order('title')
      when "title DESC"
        @assessments = Assessment.all.order('title DESC')
      when "author_name"
        @assessments = Assessment.all.sort_by{|e| e.author_name.downcase}           # need to downcase to assure right order
      when "author_name DESC"
        @assessments = Assessment.all.sort_by{|e| e.author_name.downcase}.reverse
      else        # created_at DESC as default order
        puts "Undefined sort_by option"
        @assessments = Assessment.all.order('created_at DESC')
    end


    @assessments = @assessments.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    if @latest_performance != nil && @latest_performance.current_position > -1 then
      #last performance unfinished, set next subassessment to do
      @next = Subassessment.where(assessment_id: params[:id], position: @latest_performance.current_position).first
    end

    @page = params[:page].nil? ? 1 : params[:page]
    @top_performance = Performance.where(assessment_id: @assessment.id, user_id: session[:current_user_id]).order('achieved_points DESC').first
  end

  def edit  # even admin isn't allowed to edit subassessments, he/she may only delete it
    if @assessment.user_id != session[:current_user_id] then
      flash[:notice] = "Nur der Autor einer Prüfung darf diese aendern!"
      redirect_to @assessment
    end
    @subassessments = @assessment.subassessments
  end

  def new
    @assessment = Assessment.new
  end

  def create
    @assessment = Assessment.create(assessment_params)
    @assessment.title = params[:assessment][:title]
    @assessment.description = params[:assessment][:description]
    @assessment.min_points_1 = params[:assessment][:min_points_1]
    @assessment.min_points_2 = params[:assessment][:min_points_2]
    @assessment.min_points_3 = params[:assessment][:min_points_3]
    @assessment.min_points_4 = params[:assessment][:min_points_4]
    @assessment.min_points_5 = params[:assessment][:min_points_5]
    @assessment.image = params[:assessment][:image]

    @assessment.user_id = session[:current_user_id]
    @assessment.save      # assessments created and saved
    tags = params[:tags].split(",").map{|tag| tag.strip }
    tags.each do |t|
      # attention: works only with SQLite!
      matching_tag = KnowledgeElement.find_by_sql("SELECT * FROM knowledge_elements WHERE tag = '" + t + "' COLLATE NOCASE;").first
      if matching_tag != nil then
        to_create = AssessmentContent.new
        to_create.assessment_id = @assessment.id
        to_create.knowledge_element_id = matching_tag.id
        to_create.save
      end
    end     # links between assessment and knowledge_elements created and saved
    flash[:notice] = "Prüfung erfolgreich angelegt"
    redirect_to assessment_path(@assessment)
  end

  def update

    @assessment.title = params[:assessment][:title]
    @assessment.description = params[:assessment][:description]
    @assessment.min_points_1 = params[:assessment][:min_points_1]
    @assessment.min_points_2 = params[:assessment][:min_points_2]
    @assessment.min_points_3 = params[:assessment][:min_points_3]
    @assessment.min_points_4 = params[:assessment][:min_points_4]
    @assessment.min_points_5 = params[:assessment][:min_points_5]

    if @assessment.image_file_name.nil?
    @assessment.update_attribute(:image, params[:assessment][:image])
    end

    @assessment.save

    old_tags = @assessment.knowledge_elements.map{|t| t.tag}                # tags as they were before editing
    new_tags = params[:tags].split(",").map{|tag| tag.strip }   # tags that have now been entered
    tags_to_create = new_tags - old_tags                        # tags that now have to be created
    tags_to_delete = old_tags - new_tags                        # tags that now have to be removed

    tags_to_delete.each do |t|
      # matching_tag = KnowledgeElement.where(tag: t).first
      # attention: works only with SQLite!
      matching_tag = KnowledgeElement.find_by_sql("SELECT * FROM knowledge_elements WHERE tag = '" + t + "' COLLATE NOCASE;").first
      matching_link = matching_tag.nil? ? nil : AssessmentContent.where(knowledge_element_id: matching_tag.id, assessment_id: @assessment.id).first
      # should never be nil because link already existed, check just for security
      if matching_link != nil then    # should also never be nil because link already existed, check just for security
        matching_link.destroy
      end
    end     # deleted all tags that aren't enumerated anymore

    tags_to_create.each do |t|
      # attention: works only with SQLite!
      matching_tag = KnowledgeElement.find_by_sql("SELECT * FROM knowledge_elements WHERE tag = '" + t + "' COLLATE NOCASE;").first
      if matching_tag != nil then
        to_create = AssessmentContent.new
        to_create.assessment_id = @assessment.id
        to_create.knowledge_element_id = matching_tag.id
        to_create.save
      end

    end       # created the newly entered tags
    flash[:notice] = "Prüfung erfolgreich bearbeitet!"
    redirect_to assessment_path(@assessment)
  end

  def start
    if @assessment.subassessment_counter == 0 then
      redirect_to(assessment_path(@assessment), notice: "Keine Teilaufgaben vorhanden!")
    else
      firstQuestion = Subassessment.where(assessment_id: @assessment.id).order('position ASC').first   # first question doesn't have to have position 0
      @performance = Performance.new          # for some (unknown) reason mass assignment via create didn't work
      @performance.assessment_id = params[:id]
      @performance.user_id = session[:current_user_id]
      @performance.current_position = firstQuestion.position
      @performance.achieved_points = 0
      @performance.max_points = @assessment.max_points
      @performance.save
      redirect_to perform_assessment_subassessment_path(@assessment, firstQuestion)
    end
  end

  def finish
    @performance = Performance.where(assessment_id: params[:id], user_id: session[:current_user_id]).order('created_at DESC').first
    if @performance.current_position > -2 && params[:given_points] != nil then                    # necessary to prevent multiple adding of points when reloading page
      # params[:given_points} should never be nil, check just for security
      @performance.achieved_points = @performance.achieved_points + params[:given_points].to_i
      puts "HELLO" +  params[:given_points].to_s
    end
    @performance.current_position = -2
    @performance.save
    @performances = Performance.where(assessment_id: params[:id], user_id: session[:current_user_id]).order('created_at DESC')
  end

  def destroy
    @assessment.destroy
    flash[:notice] = "Prüfung erfolgreich geloescht!"
    redirect_to assessments_path
  end

  def search
    @matching_assessments = []
    if params[:search_style] == "tags" then
      tags_to_search = params[:input_tags].split(',').map{|t| t.strip.downcase}   # stores all entered words downcased
      AssessmentContent.all.each do  |l|
        if tags_to_search.include?(l.knowledge_element.tag.downcase) then       # check for each existing link if its tag has eben entered
          @matching_assessments.push(l.assessment)                        # if yes, add corresponding assessments to matching_assessments
        end
      end
    elsif params[:search_style] == "title" then
      input_title = params[:input_title].downcase                           # downcase input title to account for simple typos
      Assessment.all.each do |e|
        e_title = e.title.downcase                                          # downcase title to account for simple typos
        if e_title.match(input_title) || input_title.match(e_title) then    # check for each assessment if its title in
          @matching_assessments.push(e)
        end
      end
    else
      # TODO redirect to error page for other search_styles
    end
    @matching_assessments = @matching_assessments.paginate(:page => params[:page], :per_page => 10)

  end

  def change_search_style
    @search_style = params[:search_style]
    respond_to do |format|
      format.js
    end
  end

  def statistics
    @performances = Performance.where(assessment_id: params[:id], user_id: session[:current_user_id], current_position: -2).order('created_at DESC')
  end

  def clef

  end


  def showclef

  end

  def assessment_params
    params.require(:assessment).permit(:image)
  end

  def remove_image
    @assessment = Assessment.find(params[:id])
    @assessment.image = nil
    @assessment.save
    redirect_to @assessment, flash: { success: 'Datei erfolgreich gelöscht.' }
  end
end

