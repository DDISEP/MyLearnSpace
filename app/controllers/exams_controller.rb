class ExamsController < ApplicationController
 def index
   @exams = Exam.all
   @knowledgeElements = KnowledgeElement.all
 end

 def show
 end

 def edit
   @subexercises = Subexercise.all
   @exercises = Exercise.all
   @knowledgeElement = KnowledgeElement.find_by_id(params[:id])
 end
end