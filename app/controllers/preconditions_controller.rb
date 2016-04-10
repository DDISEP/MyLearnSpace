class PreconditionsController < ApplicationController

  before_action :check_auth, only:[:update, :destroy, :new, :edit, :create ]

  def check_auth
    if @current_user.admin? != true then
      flash[:error] = "Nur Administratoren dürfen Preconditions erstellen und bearbeiten"
      redirect_to preconditions_map_path
    end
  end

  def check_not_learner
    if @current_user.learner?
      flash[:error] = "Nur Administratoren und Lehrer dürfen auf diese Seite zugreifen"
      redirect_to preconditions_map_path
    end
  end

  def index
    check_not_learner
    @preconditions = Precondition.all
  end

  def map
    #@knowledgeElements = KnowledgeElement.where(learning_objectives.first.parent_learning_objective.empty?)
    #@Array = []
    @knowledgeElements = KnowledgeElement.all
    @preconditions = Precondition.all
    @first_learning_objectives = []
    KnowledgeElement.all.each do |ke|
        @first_learning_objectives << ke.learning_objectives.first
    end

    @starting_knowledge_elements = []
    @passed_knowledge_elements = []
    @accessible_knowledge_elements = []
    @locked_knowledge_elements = []

    #@baeh = @first_learning_objectives.third.parent_learning_objectives.first.knowledge_element.progress.grade
    #@baeh = @first_learning_objectives.fourth.parent_learning_objectives.first.knowledge_element.progress.grade


    @first_learning_objectives.each do |flo|
      if flo.parent_learning_objective_preconditions.length <1
        @starting_knowledge_elements << flo.knowledge_element
        if !flo.knowledge_element.progress.nil? && flo.knowledge_element.progress.grade <5
          @passed_knowledge_elements << flo.knowledge_element
        else
          @accessible_knowledge_elements << flo.knowledge_element
        end

      elsif
        @number_of_unsolved_preconditions = flo.parent_learning_objective_preconditions.length
        flo.parent_learning_objective_preconditions.each do |plop|
          if !plop.parent_learning_objective.knowledge_element.progress.nil? && plop.parent_learning_objective.knowledge_element.progress.grade >0 && plop.parent_learning_objective.knowledge_element.progress.grade <5
            @number_of_unsolved_preconditions = @number_of_unsolved_preconditions - 1
          end
        end

        if @number_of_unsolved_preconditions == 0
          if !flo.knowledge_element.progress.nil? && flo.knowledge_element.progress.grade <5
            @passed_knowledge_elements << flo.knowledge_element
          else
            @accessible_knowledge_elements << flo.knowledge_element
          end
        else
          @locked_knowledge_elements << flo.knowledge_element
        end
      end
      #flash[@accessible_knowledge_elements.length]
    end

    #@knowledgeElements = KnowledgeElement.all

  end

  def new
    check_auth
    @learningObjective = LearningObjective.find_by_id(:learning_objective_id)
    @knowledgeElements = KnowledgeElement.all
    @preconditions = Precondition.all
  end

  def create
    @learningObjective = LearningObjective.find_by_id(params[:learning_objective_id])
    @necessity = params["precondition"]["necessity"]
    @parent_learning_objective = LearningObjective.find_by_id(params["precondition"]["parent_learning_objective_id"])
    if Precondition.where(:learning_objective_id => @learningObjective.id, :parent_learning_objective_id => @parent_learning_objective.id).length < 1
      @precondition = @learningObjective.parent_learning_objective_preconditions.build(:learning_objective => @learningObjective, :necessity => @necessity, :parent_learning_objective => @parent_learning_objective)
      @precondition.parent_learning_objective = @parent_learning_objective

      if @precondition.save
        flash[:notice] = "Die Lernvorraussetzung wurde erfolgreich gespeichert"
        redirect_to knowledge_elements_path
      else
        flash[:error] = "Es ist ein Fehler beim Speichern der Lernvorraussetzung aufgetreten. Bitte versuchen Sie es später erneut"
        redirect_to knowledge_elements_url
      end
    elsif
      flash[:error] = "Diese Lernvoraussetzung existiert bereits"
      redirect_to new_knowledge_element_learning_objective_precondition_path
    end
  end

  def destroy
    @precondition = Precondition.find_by_id(params[:id])
    @precondition.destroy
    flash[:notice] = "Die Precondition wurde gelöscht"
    #output missing
    redirect_to
  end

  def show
    check_auth
    @precondition = Precondition.find_by_id(params[:id])
  end

  def index
    @preconditions = Precondition.all
  end

end
