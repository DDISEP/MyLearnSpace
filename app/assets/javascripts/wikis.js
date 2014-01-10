//= require bootstrap-wysihtml5
//= require upload.js



function searchSuggest(){
	
	var str = escape(document.getElementById('search_field').value);
	if(str == "") { // muss überprüft werden weil sonst wird mit dem get ein showByName aufgerufen 
		document.getElementById('search_suggest').style.visibility='hidden';
		return;
	}
	$.get( "/wikis/searchSuggestions/"+ str);
			
	
}

function renderSearchSuggests(data){
		
		var ss = document.getElementById('search_suggest');	
		$("#search_suggest").html( "");		
		var str = data.split("\n");		
		var suggest ="";
		
		for(i=0; i < str.length - 1; i++) {
			
			suggest += '<div id="item' +i.toString() +'" ';
			suggest += 'onmouseover="javascript:suggestOver(this);" ';
			suggest += 'onmouseout="javascript:suggestOut(this);" ';
			suggest += 'onclick="javascript:setSearch(this.innerHTML);" ';
			suggest += 'class="suggest_link">';
			suggest += '<a href="/wikis/'+str[i]+ '">' +str[i] + '</a></div>';			
			
		}
		
				   
	    $("#search_suggest").html(suggest);
	    ss.style.visibility='visible';	    
	
}

function navigateThroughSuggests(k) //TODO Implementierten
{
    
  	alert("asd");
	// var keypress = document.getElementById('keypress');
	keyIn = k.keyCode;
	alert(keyIn.toString());
    suggestOut(this);
    getsFocusId = "item" + 39-keyIn;  //38 is up arrow, 40 is down
    suggestOver(document.getElementById(getFocusId));
}

//Mouse over function
function suggestOver(div_value) {
	div_value.className = 'suggest_link_over';
}
//Mouse out functi;on
function suggestOut(div_value) {
	div_value.className = 'suggest_link';
}



//Click function
function setSearch(value) {
	var str = value.split(">"); // Entfernt wieder die Linktags
	document.getElementById('search_field').value = str[1].split("<")[0];;
	document.getElementById('search_suggest').innerHTML = '';
	document.getElementById('search_suggest').style.visibility='hidden';
}

