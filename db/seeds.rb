# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Wiki.create(:title => "Anton", :article => "asdasdasd")
Wiki.create(:article => "asdjlkasdjla", :title => "ajsdklasd")
User.create(:username => 'admin', :email => 'admin@a.a', :password => 'aaaaaa', :password_confirmation => 'aaaaaa', :admin => true, :teacher => true, :learner => true)
