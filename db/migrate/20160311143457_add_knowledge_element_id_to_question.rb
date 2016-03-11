class AddKnowledgeElementIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :knowledge_element_id, :integer
  end
end
