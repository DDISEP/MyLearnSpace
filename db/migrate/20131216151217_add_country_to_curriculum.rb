class AddCountryToCurriculum < ActiveRecord::Migration
  def change
    add_column :curriculums, :country, :string
  end
end
