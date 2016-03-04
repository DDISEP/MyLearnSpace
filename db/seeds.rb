# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### Arndt-Olwitz ###
#User
User.create(:username => "admin", :email => "admin@mls.de", :password => "password", :admin => TRUE)
User.create(:username => "teacher", :email => "teacher@mls.de", :password => "password", :teacher => TRUE)
User.create(:username => "learner", :email => "learner@mls.de", :password => "password", :learner => TRUE, :pupil => TRUE)


### Hafemann-Sticha ###
#Materialtext
Materialtext.create(:title => "Materialtext1", :text => "TextZuMaterialtext1", :user_id => 1)
Materialtext.create(:title => "Materialtext2", :text => "TextZuMaterialtext2", :user_id => 2)
Materialtext.create(:title => "Materialtext3", :text => "TextZuMaterialtext3", :user_id => 3)
#Materiallink
Materiallink.create(:title => "Materiallink1", :link => "http://mylollispace.de", :user_id => 1)
Materiallink.create(:title => "Materiallink2", :link => "http://google.de", :user_id => 2)
Materiallink.create(:title => "Materiallink3", :link => "http://youtube.de", :user_id => 3)
#Materialpicture
Materialpicture.create(:title => "Materialpicture1", :file => '010101001101', :filename => "file1", :fileformat => "png", :user_id => 1)
#Materialvideo
Materialvideo.create(:title => "Materialvideo1", :file => '010101001110001', :filename => "file1", :fileformat => "avi", :user_id => 1)
#Question
Question.create(:title => "Frage1?", :text => "FragentextZurFrage1", :user_name => "admin")
Question.create(:title => "Frage2?", :text => "FragentextZurFrage2", :user_name => "teacher")
Question.create(:title => "Frage3?", :text => "FragentextZurFrage3", :user_name => "learner")
#Answer
Answer.create(:text => "Antwort1AufFrage1", :question_id => 1, :user_name => "teacher")
Answer.create(:text => "Antwort2AufFrage1", :question_id => 1, :user_name => "learner")
Answer.create(:text => "Antwort3AufFrage1", :question_id => 1, :user_name => "admin")
Answer.create(:text => "Antwort1AufFrage2", :question_id => 2, :user_name => "learner")
#Wiki
Wiki.create(:title => "DerTitel1", :article => "WikiInhalt1")
Wiki.create(:article => "DerTitel2", :title => "WikiInhalt2")


### Ellermeier-Zach ###
@ke1 = KnowledgeElement.create(:name=> "Information und Ihre Darstellung", :description => "Anhand von Beispielen aus ihrer Erfahrungswelt wird den Schülern deutlich, dass Information auf ganz unterschiedliche Weise dargestellt werden kann")
@ke2 = KnowledgeElement.create(:name=> "Informationsdarstellung mit Graphikdokumenten - Graphiksoftware", :description => "Objekte als Informationseinheiten in Graphiken/n Objekte einer Vektorgraphik: Attribut, Attributwert und Methode")
@ke3 = KnowledgeElement.create(:name=> "Informationsdarstellung mit Textdokumenten - Textverarbeitungssoftware", :description => "Objekte und Klassen in Texten, Zeichen, Absatz, Textdokument")

6.times {|i| @ke1.learning_objectives.build(cognitiveDimension: (i+1))}
6.times {|i| @ke2.learning_objectives.build(cognitiveDimension: (i+1))}
6.times {|i| @ke3.learning_objectives.build(cognitiveDimension: (i+1))}
@ke1.save
@ke2.save
@ke3.save

@lo = LearningObjective.where(:knowledge_element_id => @ke1.id, :cognitiveDimension => 4).first
@pc = @ke2.learning_objectives.first.parent_learning_objective_preconditions.build(:learning_objective => @ke2.learning_objectives.first, :necessity => true, :parent_learning_objective => @lo)