//= require bootstrap-wysihtml5

  
  
function getXmlHttpRequestObject() {
  if (window.XMLHttpRequest) {
    return new XMLHttpRequest();
  } else if(window.ActiveXObject) {
    return new ActiveXObject("Microsoft.XMLHTTP");
  } else {
    alert("Your Browser Sucks!\nIt's about time to upgrade don't you think?");
  }
}


function searchSuggest(){
	var str = escape(document.getElementById('search_field').value);
	if(str == "") { // muss überprüft werden weil sonst wird mit dem get ein showByName aufgerufen
		document.getElementById('search_suggest').style.visibility='hidden';
		return;
}
	$.get( "wikis/searchSuggestions/"+ str, function( data ) {
	
	var ss = document.getElementById('search_suggest');
	
		$("#search_suggest").html( "");
		var str = data.split("\n");
		var suggest ="";
		for(i=0; i < str.length - 1; i++) {
					
			suggest += '<div onmouseover="javascript:suggestOver(this);" ';
			suggest += 'onmouseout="javascript:suggestOut(this);" ';
			suggest += 'onclick="javascript:setSearch(this.innerHTML);" ';
			suggest += 'class="suggest_link">' + str[i] + '</div>';
			
		}
		ss.style.visibility='visible';
		$("#search_suggest").html(suggest);
		
	});
}

//Mouse over function
function suggestOver(div_value) {
	div_value.className = 'suggest_link_over';
}
//Mouse out function
function suggestOut(div_value) {
	div_value.className = 'suggest_link';
}



//Click function
function setSearch(value) {
	document.getElementById('search_field').value = value;
	document.getElementById('search_suggest').innerHTML = '';
	document.getElementById('search_suggest').style.visibility='hidden';
}
