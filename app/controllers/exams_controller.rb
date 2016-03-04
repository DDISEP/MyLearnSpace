class ExamsController < ApplicationController
 def index
   @exams = Exam.all
   @knowledgeElements = KnowledgeElement.all
 end

 def show
 end

 def edit
   @exercises = Exercise.all
 end
end