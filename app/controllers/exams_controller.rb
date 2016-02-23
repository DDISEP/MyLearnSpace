class ExamsController < ApplicationController

  def create
    @exam= Exam.new
    @exam.minPoints = 1
    @exam.maxPoints =100
    @exam.maxTime = 90
    #wie ist ein Learner mit seinen aktuellen Knowledge Elements verbunden?

  end

  def create_exercise_one (knowledge_element = '')
    exercise_ones = Subexercise.where(examItem: true,active: true, learningObjective_dimension:'remember',
    learningObjective_knowledgeElement: knowledge_element).order(created_at: :desc)
    exercise_one_hash_array1 = exercise_ones.collect {|exercise_one|{:value=> suberxercise.id} }
    if exercise_one_hash_array1.empty?
      puts 'Es existiert keine Aufgabe mit LearningObjective remember für dieses KnowledgeElement'
    else
      exercise_one_hash_array2 = exercise_one_hash_array1.shuffle
      subexercise1= Subexercises.where(id: exercise_one_hash_array2.first.value)
      if
        subexercise1.exercise.sequence== true
        show subexercise1.exercise
      else
        show subexercise1.exercise.titel
        show subexercise1.exercise.description
        show subexercise1.text

      end
    end


    

  end
end
