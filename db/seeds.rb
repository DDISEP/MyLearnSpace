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
Materialtext.create(:title => "Lorem ipsum", :text => "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", :user_id => 1, :knowledge_element_id => 1)
Materialtext.create(:title => "Goethe: Faust", :text => "Habe nun, ach! Philosophie, Juristerei und Medizin, Und leider auch Theologie Durchaus studiert, mit heißem Bemühn. Da steh ich nun, ich armer Tor! Und bin so klug als wie zuvor.", :user_id => 2, :knowledge_element_id => 2)
Materialtext.create(:title => "Robby Williams: Angels", :text => "I sit and wait, does an angel contemplate my fate, And do they know, The places where we go, When we're grey and old, 'cause I have been told, That salvation lets their wings unfold, So when I'm lying in my bed, Thoughts running through my head, And I feel that love is dead, I'm loving angels instead", :user_id => 3, :knowledge_element_id => 3)
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
Wiki.create(:title => "Föhn(elektronisches_Gerät)", :article => "Ein elektronisches Gerät zum Trocknen der Haare")
Wiki.create(:title => "Föhn(Wind)", :article => "Ein warmer Luftstrom aus den Alpen")


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