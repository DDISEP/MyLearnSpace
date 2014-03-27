class AddHyperlinkToCurriculum < ActiveRecord::Migration
  def change
    add_column :curriculums, :hyperlink, :string
  end
end
