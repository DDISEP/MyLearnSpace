class DataFile < ActiveRecord::Base
 
 
    attr_accessible :fileName, :fileType
  #Für jede Datei wird ein DB-Eintrag angelegt mit dem Original Dateinamen angelegt, auf dem Server wird die Datei mit file[ID] gespeichert um ein versehentliches Überschreiben zu verhindern
    
    def self.save(uploaded_io)
    if uploaded_io.nil?
    return false
    end
    filename = sanitize_filename(uploaded_io.original_filename)
    
    #fileType auslesen
    tmp = filename.split('.')
    if(tmp.size == 1)
      filetype = nil 
    else
      filetype = tmp.last
    end
    #Datenbankeintrag anlegen
    uploadedFile = DataFile.create(fileName: filename, fileType: filetype)
    
     #Datei speichern     
    File.open(Rails.root.join('public', 'uploads', uploadedFile.getStorableName), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    
    return true
  end

  def getStorableName
    if fileType.nil?
      return "file"+id.to_s
    else
      return "file"+id.to_s + "."+fileType  
    end
  end
  def self.sanitize_filename(file_name)
    # nur den Dateinamen abrufen / nicht den ganzen Dateipfad
    just_filename = File.basename(file_name)
    #Sonderzeichen durch Unterstrich ersetzen
    just_filename.sub(/[^\w\.\-]/,'_')
    
  end
end

