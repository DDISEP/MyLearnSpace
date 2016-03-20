class AddKnowledgeElementToExams < ActiveRecord::Migration
  def change
    add_column :exams, :knowledge_element_id, :integer
  end
end
