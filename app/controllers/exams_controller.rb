class ExamsController < ApplicationController
 def index
   @exams = Exam.all
   @knowledgeElements = KnowledgeElement.all
 end

 def show
 end

 def edit
   @exam =Exam.new
   @subexercises1 = Subexercise.where(examItem: TRUE, active: TRUE, cognitive_dimension: 1)
   @exercises = Exercise.all
   @knowledgeElements = KnowledgeElement.find_by_id(params[:id])
   @subexercises2 = Subexercise.where(examItem: TRUE, active: TRUE, cognitive_dimension: 3)
   @subexercises3 = Subexercise.where(examItem: TRUE, active: TRUE, cognitive_dimension: 6)

 end
end