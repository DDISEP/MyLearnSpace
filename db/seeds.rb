# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Wiki
Wiki.create(:title => "DerTitel1", :article => "WikiInhalt1")
Wiki.create(:article => "DerTitel2", :title => "WikiInhalt2")

#User
User.create(:username => "admin", :email => "admin@mls.de", :password => "password", :admin => TRUE)
User.create(:username => "teacher", :email => "teacher@mls.de", :password => "password", :teacher => TRUE)
User.create(:username => "learner", :email => "learner@mls.de", :password => "password", :learner => TRUE)

#Question
Question.create(:title => "Frage1?", :text => "FragentextZurFrage1")
Question.create(:title => "Frage2?", :text => "FragentextZurFrage2")

#Materialtext
Materialtext.create(:title => "Materialtext1?", :text => "TextZuMaterialtext1")

#Topic
#Topic.create(:name => "TopicName1", :description => "TopicDesc1", :subject => :Mathematik)

#Exercise
#Exercise.create(:title => "Aufgabentitel1", :description => "Aufgabenbeschreibung1", :author_name => "admin")