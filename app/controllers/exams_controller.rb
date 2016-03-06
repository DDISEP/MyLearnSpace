class ExamsController < ApplicationController
 def index
   @exams = Exam.all
   @knowledgeElements = KnowledgeElement.all
 end

 def show
 end

 def edit
   @subexercises1 = Subexercise.where(examItem: TRUE, active: TRUE, learning_objective_id: 1)
   @exercises = Exercise.all
   @knowledgeElements = KnowledgeElement.find_by_id(params[:id])
   @subexercises2 = Subexercise.where(examItem: TRUE, active: TRUE, learning_objective_id: 3)

 end
end