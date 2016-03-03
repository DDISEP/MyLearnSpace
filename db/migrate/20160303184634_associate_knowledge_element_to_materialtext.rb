class AssociateKnowledgeElementToMaterialtext < ActiveRecord::Migration
  def change
    #create_table :knowledge_elements_materialtexts, id: false do |t|
    #  t.belongs_to :knowledge_elements, index: true
    #  t.belongs_to :materialtext, index: true
    #end
    create_join_table :knowledge_elements, :materialtexts do |t|
      t.index :knowledge_element_id
      t.index :materialtext_id
    end
  end
end
