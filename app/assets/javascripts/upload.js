
function validateFiles(inputFile) {
  var maxExceededMessage = "Die Datei ist zu groß! (Max 5 MB)";
  var extErrorMessage = "Nur Bilder (jpg,jpeg,gif,png), Videos (mp4) oder Dateien vom Typ(pdf,txt) sind erlaubt!";
  var allowedExtension = ["jpg", "jpeg", "gif", "png", "pdf", "txt", "mp4"];
 
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
	document.getElementById('uploadState').className = 'alert alert-danger';
    $(inputFile).val('');
    return;
  };
 
  if (extError) {
    $("#uploadState").html(extErrorMessage);
    document.getElementById('uploadState').className = 'alert alert-danger';
    $(inputFile).val('');
  }
  else{
  	 $("#uploadState").html("");
  	 document.getElementById('uploadButton').style.visibility='visible';
  	 document.getElementById('uploadState').className='';   	 
  	 
  	 
  };
}
function uploadProcessing(){
	document.getElementById('uploadButton').style.visibility='hidden';
	$("#uploadProgess").html('<img src="/assets/loader.gif" alt="Uploading...">');

	
}
