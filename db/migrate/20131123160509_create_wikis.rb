class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :article
      t.integer :clicks
      
      # t.lehrplan :lehrplan mehrere
      # Versionen? KOmmentare?
      #Autoren?
      
    

      t.timestamps
    end
  end
end
