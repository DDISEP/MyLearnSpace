
function validateFiles(inputFile) {
  var maxExceededMessage = "Die Datei ist zu groß! (Max 5 MB)";
  var extErrorMessage = "Nur Bilder (jpg,jpeg,gif,png) oder Dateien vom Typ(pdf,txt) sind erlaubt!";
  var allowedExtension = ["jpg", "jpeg", "gif", "png", "pdf", "txt"];
 
  var extName;
  var maxFileSize = $(inputFile).data('max-file-size');
  var sizeExceeded = false;
  var extError = false;
 
  $.each(inputFile.files, function() {
    if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
    extName = this.name.split('.').pop();
    if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
  });
  if (sizeExceeded) {
    $("#uploadState").html(maxExceededMessage);
    $(inputFile).val('');
    return;
  };
 
  if (extError) {
    $("#uploadState").html(extErrorMessage);
    $(inputFile).val('');
  }
  else{
  	 $("#uploadState").html("");
  };
}
