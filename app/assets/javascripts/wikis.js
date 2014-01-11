//= require bootstrap-wysihtml5
//= require upload.js
//= require bootstrap-tagsinput.js





function page2(){
	document.getElementById('form1').style.display='none';
	document.getElementById('form2').style.display='block';
	document.getElementById('uploadForm').style.display='block';
	
	var newPagination = '<li><a href="#" onclick="page1()">&laquo;</a></li> <li><a href="#" onclick="page1()">1 </a></li>';
	newPagination += '<li id="nav2" class="active"><a href="#">2 <span class="sr-only">(current)</span></a></li>';
	newPagination += '<li class="disabled"><a href="#">&raquo;</a></li>';
	$("#pagination").html( newPagination);

}
function page1(){
	document.getElementById('form1').style.display='block';
	document.getElementById('form2').style.display='none';
	document.getElementById('uploadForm').style.display='none';
	var newPagination = ' <li class="disabled"><a href="#">&laquo;</a></li>';
	newPagination += '<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>';
	newPagination += '<li><a href="#" onclick="page2()">2</a></li>';
	newPagination += '<li><a href="#" onclick="page2()">&raquo;</a></li>';
	$("#pagination").html( newPagination);
}
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

