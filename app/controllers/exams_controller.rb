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
 end
end