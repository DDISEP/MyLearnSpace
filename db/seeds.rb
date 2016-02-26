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
Materialtext.create(:title => "Materialtext1?", :text => "TextZuMaterialtext1", :user_id => 1)

#Materiallink
Materiallink.create(:title => "Materiallink1?", :link => "http://mylollyspace.de", :user_id => 1)

#Materialpicture
Materialpicture.create(:title => "Materialpicture1", :file => 010101001101, :user_id => 1)

#Materialvideo
Materialvideo.create(:title => "Materialpicture1", :file => 010101001110001, :user_id => 1)