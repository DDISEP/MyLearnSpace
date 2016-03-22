class ExamsController < ApplicationController
 def index
   @exams = Exam.all
   @knowledgeElements = KnowledgeElement.all
 end

 def new
   @exam = Exam.new
   @exam.maxPoints = params[:text]

   respond_to do |format|
     if @exam.save
       format.html { redirect_to @exam, notice: 'Die Antwort wurde erfolgreich erstellt.' }
       format.json { render action: 'show', status: :created, location: @exam }
     else
       format.html { render action: 'new' }
       format.json { render json: @exam.errors, status: :unprocessable_entity }
     end
   end
 end

 def show
 end

 def edit
   @exam =Exam.new
   @subexercises1 = Subexercise.where(examItem: TRUE, active: TRUE, cognitive_dimension: 1)
   @exercises = Exercise.all
   @knowledgeElements = KnowledgeElement.find_by_id(params[:id])
   @subexercises2 = Subexercise.where(examItem: TRUE, active: TRUE, cognitive_dimension: 3)
   @subexercises3 = Subexercise.where(examItem: TRUE, active: TRUE, cognitive_dimension: 5)

 end

 def create
 end
end