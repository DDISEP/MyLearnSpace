class AddKnowledgeElementToProgress < ActiveRecord::Migration
  def change
    add_column :progresses, :knowledge_element_id, :integer
  end
end
