# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### Arndt-Olwitz ###
#User
User.create(:username => "admin", :email => "admin@mls.de", :firstname => "Admin", :lastname => "Test", :birthday => Date.new(1990,1,1), :password => "Password123!", :admin => TRUE)
User.create(:username => "teacher", :email => "teacher@mls.de", :firstname => "Teacher", :lastname => "Test", :birthday => Date.new(1990,1,1),:password => "Password123!", :teacher => TRUE)
User.create(:username => "learner", :email => "learner@mls.de", :firstname => "Learner", :lastname => "Test", :birthday => Date.new(1995,1,1), :password => "Password123!", :learner => TRUE, :pupil => TRUE)
User.create(:username => "learner2", :email => "learner2@mls.de", :firstname => "Learner2", :lastname => "Test2", :birthday => Date.new(2000,1,1), :password => "Password123!", :learner => TRUE, :pupil => TRUE)
#Newsfeed
Newsfeed.create(:subject => "Ein Testnewsfeed an alle", :message => "Dies ist der Inhalt der Testnachricht an alle. Sehr wichtig.. ;)", :newsfeedToAll => TRUE)
Newsfeed.create(:subject => "Ein Testnewsfeed für ADMINS", :message => "Dies ist der Inhalt der Testnachricht an die ADMINS. Noch wichtiger.. ;)", :newsfeedToAll => FALSE)
Newsfeed.create(:subject => "Ein Testnewsfeed für TEACHER", :message => "Dies ist der Inhalt der Testnachricht an die Lehrer. Eventuell interessant :P", :newsfeedToTeachers => TRUE)
Newsfeed.create(:subject => "Ein Testnewsfeed für ADMINS mit nur ADMINS", :message => "Dies ist der Inhalt der Testnachricht an die ADMINS. 2", :newsfeedToAdmins => TRUE)
#PeerToPeerMessages
PeerToPeerMessage.create(:sender => 1, :reciever => 2, :subject => "von 1 zu 2", :message => "Vom Admin an den Teacher.")
PeerToPeerMessage.create(:sender => 1, :reciever => 3, :subject => "von 1 zu 3", :message => "Vom Admin an den Learner.")
PeerToPeerMessage.create(:sender => 2, :reciever => 3, :subject => "von 2 zu 3", :message => "Vom Teacher an den Learner.")
PeerToPeerMessage.create(:sender => 2, :reciever => 1, :subject => "von 2 zu 1", :message => "Vom Teacher an den Admin.")
PeerToPeerMessage.create(:sender => 3, :reciever => 1, :subject => "von 3 zu 1", :message => "Vom Learner an den Admin.")
PeerToPeerMessage.create(:sender => 3, :reciever => 2, :subject => "von 3 zu 2", :message => "Vom Learner an den Teacher.")

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
#Topic
@to1 = Topic.create(:name=> "Einführung in die Informationsverarbeitung", :description => "Erste Erfahrungen mit Informationen und wie man sie verarbeitet.", :subject => "Informatik")
@to2 = Topic.create(:name=> "Rechnen in Zahlenräumen", :description => "Zahlenräume der natürlichen Zahlen, ganze Zahlen, rationale Zahlen und reelle Zahlen und wie man in diesen rechnet", :subject => "Mathematik")
@to3 = Topic.create(:name=> "Funktionen und funktionale Zusammenhänge", :description => "Rechnen mit Funktionen und Erlernen der Funktionsweise von funktionalen Zusammenhängen in vielerlei Hinsicht", :subject => "Mathematik, Informatik")
#Knowledge_ElementAAAA
@ke1 = KnowledgeElement.create(:name=> "Rechnen mit Brüchen", :description => "Berechnungen von Zahlen im Zahlenraum der rationalen Zahlen", :topic => @to2)
@ke2 = KnowledgeElement.create(:name=> "LineareFunktionen", :description => "Rechnen und Anwenden von linearen Funktionen", :topic => @to3)
@ke3 = KnowledgeElement.create(:name=> "Information und Ihre Darstellung", :description => "Anhand von Beispielen aus ihrer Erfahrungswelt wird den Schülern deutlich, dass Information auf ganz unterschiedliche Weise dargestellt werden kann", :topic => @to1)
@ke4 = KnowledgeElement.create(:name=> "Informationsdarstellung mit Graphikdokumenten - Graphiksoftware", :description => "Objekte als Informationseinheiten in Graphiken/n Objekte einer Vektorgraphik: Attribut, Attributwert und Methode", :topic => @to1)
@ke5 = KnowledgeElement.create(:name=> "Informationsdarstellung mit Textdokumenten - Textverarbeitungssoftware", :description => "Objekte und Klassen in Texten, Zeichen, Absatz, Textdokument", :topic => @to1)
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



### Grett, ottinger ###
#Subexercise
Subexercise.create(:position => 1, :text => "y= 2x + 1", :solution_id =>1, :exercise_id => 1, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 1)
Subexercise.create(:position => 1, :text => "y = x - 1", :solution_id => 2, :exercise_id => 1, :points => 2, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 2)
Subexercise.create(:position => 1, :text => "Die Gerade verläuft durch den Punkt A(2/3) und m=2", :exercise_id => 2, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 3)
Subexercise.create(:position => 1, :text => "Die Gerade verläuft durch die Punkte A(1/6) und B(-3/1)", :exercise_id => 2, :points => 4, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 1)
Subexercise.create(:position => 1, :text => "y-Achsenabschnitt", :exercise_id => 3, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1, :user_id => 2)
Subexercise.create(:position => 1, :text => "Steigung", :exercise_id => 3, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1, :user_id => 3)
Subexercise.create(:position => 1, :text => "Geg.: A(0/3), B(4/6). Vorgehen: 6=m4 + t => t=6/4m => 6=m4 + 6/4m ...", :exercise_id => 10, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 5, :user_id => 1)
Subexercise.create(:position => 1, :text => "Nenner", :exercise_id => 4, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1, :user_id => 2)
Subexercise.create(:position => 1, :text => "Zähler", :exercise_id => 4, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1, :user_id => 3)
Subexercise.create(:position => 1, :text => "1/2 + 3/4", :exercise_id => 5, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 1)
Subexercise.create(:position => 1, :text => "5/3 - 7/8", :exercise_id => 5, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 2)
Subexercise.create(:position => 1, :text => "3/5 : 4/3", :exercise_id => 5, :points => 1, :moderated => FALSE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 3)
Subexercise.create(:position => 1, :text => "6/9", :exercise_id => 6, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 1)
Subexercise.create(:position => 1, :text => "5/10", :exercise_id => 6, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 2)
Subexercise.create(:position => 1, :text => "Rationale Zahlen", :exercise_id => 8, :points => 1, :moderated => FALSE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 1, :user_id => 3)
Subexercise.create(:position => 1, :text => "3/4  1/2  5/6  ", :exercise_id => 9, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 3, :user_id => 1)
Subexercise.create(:position => 1, :text => "Für dein neues Smartphone zahlst du zunächst nur die Hälfte, muss dann aber ein Jahr lang jeden Monat 1/10 vom Kaufpreis zahlen.", :exercise_id => 7, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 5, :user_id => 2)
Subexercise.create(:position => 1, :text => "Paula bezahlt 20% mehr für ihr Smartphone als Toni, ihr Vertrag kostet jedoch 10% weniger als Tonis. ", :exercise_id => 7, :points => 1, :moderated => TRUE, :active => TRUE, :examItem => TRUE, :cognitive_dimension => 5, :user_id => 3)

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

#Solution
Solution.create(:solution => "-1/2", :description => "y = 0 => 2x + 1 = 0 | -1 => 2x = -1 | * 1/2 => x = -1/2; ", :subexercise_id => 1)
Solution.create(:solution => "1", :description => "y = 0 => x - 1 = 0 | + 1 => x = 1", :subexercise_id => 2)
Solution.create(:solution => "y = 2x - 1", :description => "y = mx+ t = 2 x + t, mit A(2|3): 3 = 2*2 + t | - 4=>  t = -1 => y = 2x -1 ", :subexercise_id => 3)
Solution.create(:solution => "y = -5/4x + 19/4", :description => "m = dy / dx = (1-6)/1-(-3)) = -5/4 (2 BE), y = mx+t = -5/4*x + t; A in y einsetzen: 6 = -5/4+t => t = 19/4; y = -5/4*x + 19/4", :subexercise_id => 4)
Solution.create(:solution => "Der Punkt, in dem eine Gerade die y-Achse schneidet", :description => "In der Geradengleichung wird der y-Achsenabschnitt üblicherweise als t bezeichnet.", :subexercise_id => 5)
Solution.create(:solution => "Steigung beschreibt den Winkel, den die Gerade zur x-Achse hat.", :description => "In der Geradengleichung wird der y-Achsenabschnitt als m bezeichnet und als dy/dx zweiter Punkte auf der Gerade bestimmt", :subexercise_id => 6)
Solution.create(:solution => "Falsch", :description => "m wird als Verhältnis der x- und y-Werte der gegebenen Punkte bestimmt, t durch einsetzen eines Punktes", :subexercise_id => 7)
Solution.create(:solution => "Beschreibt die Anzahl der Anteile", :description => "Ist in der Bruchschreibeweise p/q oben, also p", :subexercise_id => 8)
Solution.create(:solution => "Beschreibt den Anteil von 1", :description => "Ist in der Bruchschreibweise p/q unten, also q", :subexercise_id => 9)
Solution.create(:solution => "5/4", :description => "1/2 + 3/4 = 2/4 + 3 /4 = (2+3)4 = 5/4", :subexercise_id => 10)
Solution.create(:solution => "19/24", :description => "5/3-7/8 = 40/24 - 21/24 = (40-21)/24 = 19/24", :subexercise_id => 11)
Solution.create(:solution => "9/20", :description => "3/5 : 4/3 = (3*3)/(5*4) = 9/20", :subexercise_id => 12)
Solution.create(:solution => "2/3", :description => "ggT (6,9)= 3; 6:3 = 2; 9:3 = 3", :subexercise_id => 13)
Solution.create(:solution => "1/2", :description => "ggT(5,10) = 5; 5:5 = 1; 10:5 = 2", :subexercise_id => 14)
Solution.create(:solution => "Q = {p/q | p aus Z und q aus N/{0}", :description => "Die Menge aller Brüche mit einer ganzen Zahl im Nenner und einer natürlichen Zahl im Zähler. 0 darf dabei nicht im Zähler stehen.", :subexercise_id => 15)
Solution.create(:solution => "1/2 < 3/4 < 5/6", :description => "kgV(2,6,4) = 12; 3/4 = 9/12 1/2 = 6/12; 5/6 = 10/12;", :subexercise_id => 16)
Solution.create(:solution => "Schlechtes Angebot", :description => "0,5 * p + 12*1/10 * p = 5/10 * p + 12/10 * p = 22/10 * p; Man müsste mehr als doppelt so viel zahlen", :subexercise_id => 17)
Solution.create(:solution => "Abhängig von der Vertragslaufzeit", :description => "Sobald der Vertrag eine gewisse Lauftzeit hat, ist Paulas Vertrag besser. Dieser Laufzeitwert bestimmt sich als der Schnittpunkt der Geraden der Kosten pro Monat.", :subexercise_id => 18)

#Performance
Performance.create(:achieved_points => 1, :user_id => 3, :handedin => "0,5", :subexercise_id => 14)
Performance.create(:achieved_points => 1, :user_id => 3, :handedin => "1/2", :subexercise_id => 14)
Performance.create(:achieved_points => 0, :user_id => 3, :handedin => "nicht kürzbar", :subexercise_id => 14)
Performance.create(:achieved_points => 0, :user_id => 3, :handedin => "4/5", :subexercise_id => 14)
