# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### Arndt-Olwitz ###
#User
User.create(:username => "admin", :email => "admin@mls.de", :password => "Password123!", :admin => TRUE)
User.create(:username => "teacher", :email => "teacher@mls.de", :password => "Password123!", :teacher => TRUE)
User.create(:username => "learner", :email => "learner@mls.de", :password => "Password123!", :learner => TRUE, :pupil => TRUE)


### Hafemann-Sticha ###
#Materialtext
Materialtext.create(:title => "Lorem ipsum", :text => "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", :user_id => 1, :knowledge_element_id => 1)
Materialtext.create(:title => "Goethe: Faust", :text => "Habe nun, ach! Philosophie, Juristerei und Medizin, Und leider auch Theologie Durchaus studiert, mit heißem Bemühn. Da steh ich nun, ich armer Tor! Und bin so klug als wie zuvor.", :user_id => 2, :knowledge_element_id => 2)
Materialtext.create(:title => "Robbie Williams: Angels", :text => "I sit and wait, does an angel contemplate my fate, And do they know, The places where we go, When we're grey and old, 'cause I have been told, That salvation lets their wings unfold, So when I'm lying in my bed, Thoughts running through my head, And I feel that love is dead, I'm loving angels instead", :user_id => 3, :knowledge_element_id => 3)
#Materiallink
Materiallink.create(:title => "Facebook", :link => "http://facebook.com", :user_id => 1, :knowledge_element_id => 1)
Materiallink.create(:title => "Google", :link => "http://google.de", :user_id => 2, :knowledge_element_id => 2)
Materiallink.create(:title => "Youtube", :link => "http://youtube.de", :user_id => 3, :knowledge_element_id => 3)
#Materialpicture
Materialpicture.create(:title => "Testbild", :user_id => 2, :file_file_name => "image.gif", :file_content_type => "image/gif", :file_file_size => 10641, :knowledge_element_id => 2)
#Materialvideo
Materialvideo.create(:title => "Häschen", :user_id => 3, :file_file_name => "hasi.mp4", :file_content_type => "video/mp4", :file_file_size => 1057149, :knowledge_element_id => 1)
#Materialdocument
Materialdocument.create(:title => "Druckertest", :user_id => 2, :file_file_name => "testfile.pdf", :file_content_type => "application/pdf", :file_file_size => 80513, :knowledge_element_id => 3)
#Question
Question.create(:title => "Welche Farbe hat euer Kugelschreiber?", :text => "Mich interessiert, welche Farbe euer Kugelschreiber hat :)", :user_name => "admin", :knowledge_element_id => 1)
Question.create(:title => "Gefällt dir MLS?", :text => "Habt ihr Anregungen oder Feedback?", :user_name => "teacher", :knowledge_element_id => 2)
Question.create(:title => "Käse oder Schinken?", :text => "Was esst ihr denn lieber?", :user_name => "learner", :knowledge_element_id => 3)
#Answer
Answer.create(:text => "blau", :question_id => 1, :user_id => 2)
Answer.create(:text => "schwarz", :question_id => 1, :user_id => 3)
Answer.create(:text => "auch blau", :question_id => 1, :user_id => 1)
Answer.create(:text => "nur Dienstags ...", :question_id => 2, :user_id => 3)
#Wiki
Wiki.create(:title => "Föhn (elektronisches_Gerät)", :article => "Ein elektronisches Gerät zum Trocknen der Haare")
Wiki.create(:title => "Föhn (Wind)", :article => "Ein warmer Luftstrom aus den Alpen")


### Ellermeier-Zach ###
#Knowledge_Element
@ke1 = KnowledgeElement.create(:name=> "Information und Ihre Darstellung", :description => "Anhand von Beispielen aus ihrer Erfahrungswelt wird den Schülern deutlich, dass Information auf ganz unterschiedliche Weise dargestellt werden kann")
@ke2 = KnowledgeElement.create(:name=> "Informationsdarstellung mit Graphikdokumenten - Graphiksoftware", :description => "Objekte als Informationseinheiten in Graphiken/n Objekte einer Vektorgraphik: Attribut, Attributwert und Methode")
@ke3 = KnowledgeElement.create(:name=> "Informationsdarstellung mit Textdokumenten - Textverarbeitungssoftware", :description => "Objekte und Klassen in Texten, Zeichen, Absatz, Textdokument")
#Learning_Objective
6.times {|i| @ke1.learning_objectives.build(cognitiveDimension: (i+1))}
6.times {|i| @ke2.learning_objectives.build(cognitiveDimension: (i+1))}
6.times {|i| @ke3.learning_objectives.build(cognitiveDimension: (i+1))}
@ke1.save
@ke2.save
@ke3.save
#Precondition
@lo = LearningObjective.where(:knowledge_element_id => @ke1.id, :cognitiveDimension => 4).first
@pc = @ke2.learning_objectives.first.parent_learning_objective_preconditions.build(:learning_objective => @ke2.learning_objectives.first, :necessity => true, :parent_learning_objective => @lo)
@pc.parent_learning_objective = @lo
@pc.save!
@pc = @ke3.learning_objectives.first.parent_learning_objective_preconditions.build(:learning_objective => @ke3.learning_objectives.first, :necessity => true, :parent_learning_objective => @lo)
@pc.parent_learning_objective = @lo
@pc.save!


### Grett ###
#Subexercise
Subexercise.create(:position => 1, :text => "y= 2x + 1", :solution_id =>1, :exercise_id => 1, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "y = x - 1", :solution_id => 2, :exercise_id => 1, :points => 2, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "Die Gerade verläuft durch den Punkt A(2/3) und m=2", :solution_id => 4, :exercise_id => 2, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "Die Gerade verläuft durch die Punkte A(1/6) und B(-3/1)", :solution_id => 2, :exercise_id => 2, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "y-Achsenabschnitt", :solution_id => 2, :exercise_id => 3, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1)
Subexercise.create(:position => 1, :text => "Steigung", :solution_id => 2, :exercise_id => 3, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1)
Subexercise.create(:position => 1, :text => "Geg.: A(0/3), B(4/6). Vorgehen: 6=m4 + t => t=6/4m => 6=m4 + 6/4m ...", :solution_id => 2, :exercise_id => 10, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 5)

Subexercise.create(:position => 1, :text => "Nenner", :solution_id => 2, :exercise_id => 4, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1)
Subexercise.create(:position => 1, :text => "Zähler", :solution_id => 2, :exercise_id => 4, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1)
Subexercise.create(:position => 1, :text => "1/2 + 3/4", :solution_id => 2, :exercise_id => 5, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "5/3 - 7/8", :solution_id => 2, :exercise_id => 5, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "3/5 : 4/3", :solution_id => 2, :exercise_id => 5, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "6/9", :solution_id => 2, :exercise_id => 6, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "5/10", :solution_id => 2, :exercise_id => 6, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "Rationale Zahlen", :solution_id => 2, :exercise_id => 8, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1)
Subexercise.create(:position => 1, :text => "3/4  1/2  5/6  ", :solution_id => 2, :exercise_id => 9, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3)
Subexercise.create(:position => 1, :text => "Für dein neues Smartphone zahlst du zunächst nur die Hälfte, muss dann aber ein Jahr lang jeden Monat 1/10 vom Kaufpreis zahlen.", :solution_id => 2, :exercise_id => 7, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 5)
Subexercise.create(:position => 1, :text => "Paula bezahlt 20% mehr für ihr Smartphone als Toni, ihr Vertrag kostet jedoch 10% weniger als Tonis. ", :solution_id => 2, :exercise_id => 7, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 5)

#Exercise
Exercise.create(:title=> "Berechnung der Nullstelle", :description=> "Berechne die Nullstelle der folgenden linearen Funktion", :user_id => 1, :knowledge_element_id=>2, :sequence => FALSE)
Exercise.create(:title=> "Aufstellen von Geradengleichungen", :description=> "Stelle die Gleichung der linearen Funktion auf, für die gilt:", :user_id => 2, :knowledge_element_id =>2, :sequence => FALSE)
Exercise.create(:title=> "Fachbegriffe zum Thema lineare Funktionen", :description=> "Erkläre folgende Fachbegriffe", :user_id => 2, :knowledge_element_id =>2, :sequence => FALSE)
Exercise.create(:title=> "Fachbegriffe zum Thema Brüche", :description=> "Erkläre folgende Fachbegriffe", :user_id => 2, :knowledge_element_id =>1, :sequence => FALSE)
Exercise.create(:title=> "Berechnung von Brüchen", :description=> "Berechne folgende Bruchaufgaben", :user_id => 2, :knowledge_element_id =>1, :sequence => FALSE)
Exercise.create(:title=> "Kürzen von Brüchen", :description=> "Kürze folgende Brüche", :user_id => 2, :knowledge_element_id =>1, :sequence => FALSE)
Exercise.create(:title=> "Bewerten von Angeboten", :description=> "Bewerte folgendes Angebot", :user_id => 2, :knowledge_element_id =>1, :sequence => FALSE)
Exercise.create(:title=> "Rationale Zahlen", :description=> "Erläutere die Menge", :user_id => 2, :knowledge_element_id =>1, :sequence => FALSE)
Exercise.create(:title=> "Ordnen von Brüchen", :description=> "Ordne folgende Brüche der Größe nach", :user_id => 2, :knowledge_element_id =>1, :sequence => FALSE)
Exercise.create(:title=> "Bewertung des Vorgehens", :description=> "Bewerte das Vorgehen zum Aufstellen von Geradengleichungen", :user_id => 2, :knowledge_element_id =>2, :sequence => FALSE)


#Progress
Progress.create(:learner_id =>3, :teacher_id=>1, :knowledge_element_id=>1, :grade =>3)
Progress.create(:learner_id =>3, :teacher_id=>2, :knowledge_element_id=>2, :grade =>2)
