# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Wiki.create(:title => "Anton", :article => "asdasdasd")
Wiki.create(:article => "asdjlkasdjla", :title => "ajsdklasd")

@ke1 = KnowledgeElement.create(:name=> "Information und Ihre Darstellung", :description => "Anhand von Beispielen aus ihrer Erfahrngswelt wird den Schülern deutlich, dass Information auf ganz unterschiedliche Weise dargestellt werden kann")
@ke2 = KnowledgeElement.create(:name=> "Informationsdarstellung mit Graphikdokumenten - Graphiksoftware", :description => "Objekte als Informationseinheiten in Graphiken/n Objekte einer Vektorgraphik: Attribut, Attributwert und Methode")
@ke3 = KnowledgeElement.create(:name=> "Informationsdarstellung mit Textdokumenten - Textverarbeitungssoftware", :description => "Objekte und Klassen in Texted, Zeichen, Absatz, Textdokument")

#LearningObjective.create(:knowledge_element => @ke1, cognitiveDimension: 1)
#LearningObjective.create(:knowledge_element_id => 1, cognitiveDimension: 2)
#@ke1.learning_objectives.build(cognitiveDimension: 1)
#6.times {|i| @ke1.learning_objectives.build(cognitiveDimension: i)}
#6.times {|i| @ke2.learning_objectives.build(cognitiveDimension: i)}
#6.times {|i| @ke2.learning_objectives.build(cognitiveDimension: i)}

#@ke2.learning_objectives.parent_learning_objective_preconditions.build(LearningObjectives.where(:knowledge_element_id => @ke1.id, :cognitiveDimension => 4))

#@ke2.learning_objectives.first.parent_learning_objective_preconditions.build(:child_learning_objective => @ke2.learning_objectives.first,
#                                                                             :parent_learning_objective =>LearningObjective.where(:knowledge_element_id => @ke1.id, :cognitiveDimension => 4))

#@ke2.learning_objectives.first.preconditions.build(:child_learning_objective => @ke2.learning_objectives.first,
#                                                                             :parent_learning_objective =>LearningObjective.where(:knowledge_element_id => @ke1.id, :cognitiveDimension => 4))

Precondition.create(:child_learning_objective_id => @ke2.learning_objectives.first, :parent_learning_objective_id => LearningObjective.where(:knowledge_element_id => @ke1.id, :cognitiveDimension => 4) )