//= require bootstrap-wysihtml5
//= require upload.js


function toggleCollapse(id){
	var collapse = document.getElementById(id);
	if(collapse.className != 'panel-collapse collapse in'){
	collapse.style='';
	collapse.className ='panel-collapse collapse in';
	}
	else{
		collapse.className ='panel-collapse collapse';
	}
	
}

function insertLink(){

var editor = $('#articleInput').data("wysihtml5").editor;
var value = editor.getValue();
var url = document.getElementById('url').value;
if (!(/^http:\/\//).test(url)) // http:// muss immer vor dem Link stehen da sonst der XSS Schutz des Editors greift
	url= 'http:\/\/' + url;
url = ' <a href="' + url +'">'+document.getElementById('linkText').value; +'</a>';
editor.setValue(value + url, true);
toggleCollapse('collapseLink');

}
function insertArticle(){

var editor = $('#articleInput').data("wysihtml5").editor;
var value = editor.getValue();
var url = document.getElementById('article_field').value;
var url= window.location.host + "/wikis/"+ url;
if (!(/^http:\/\//).test(url)) // http:// muss immer vor dem Link stehen da sonst der XSS Schutz des Editors greift
	url= 'http:\/\/' + url;
url = '<b><a href="' + url +'">'+document.getElementById('article_field').value; +'</a></b>';
editor.setValue(value + url, true);
toggleCollapse('collapseArticleLink');

}



function page2(){
	document.getElementById('form1').style.display='none';
	document.getElementById('form2').style.display='block';
	document.getElementById('uploadForm').style.display='none';
	
	var newPagination = '<li><a href="#" onclick="page1()">&laquo;</a></li> <li><a href="#" onclick="page1()">1 </a></li>';
	newPagination += '<li id="nav2" class="active"><a href="#">2 <span class="sr-only">(current)</span></a></li>';
	newPagination += '<li class="disabled"><a href="#">&raquo;</a></li>';
	$("#pagination").html( newPagination);

}
function page1(){
	document.getElementById('form1').style.display='block';
	document.getElementById('form2').style.display='none';
	document.getElementById('uploadForm').style.display='block';
	var newPagination = ' <li class="disabled"><a href="#">&laquo;</a></li>';
	newPagination += '<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>';
	newPagination += '<li><a href="#" onclick="page2()">2</a></li>';
	newPagination += '<li><a href="#" onclick="page2()">&raquo;</a></li>';
	$("#pagination").html( newPagination);
}

function searchSuggest(id){
	var str = escape(document.getElementById(id+"_field").value);
	if(str == "") { 
		document.getElementById(id+"_suggest").style.visibility='hidden';
		return;
	}
	$.get( "/wikis/searchSuggestions/"+ str+ "-" + id);
	
			
	
}

function renderSearchSuggests(data){
		
		
		var ss = document.getElementById('search_suggest');	
		$("#search_suggest").html( "");		
		var str = data.split("\n");		
		var suggest ="";
		
		for(i=0; i < str.length - 1; i++) {
			
			suggest += '<div id="learning_units' +i.toString() +'" ';
			suggest += 'onmouseover="javascript:suggestOver(this);" ';
			suggest += 'onmouseout="javascript:suggestOut(this);" ';
			suggest += 'onclick="javascript:setSearch(this.innerHTML);" ';
			suggest += 'class="suggest_link">';
			suggest += '<a href="/wikis/'+str[i]+ '">' +str[i] + '</a></div>';			
			
		}
		
				   
	    $("#search_suggest").html(suggest);
	    ss.style.visibility='visible';	    
	
}
function renderLinkSuggests(data){
			
		var ss = document.getElementById('article_suggest');	
		$("#article_suggest").html( "");		
		var str = data.split("\n");		
		var suggest ="";
		
		for(i=0; i < str.length - 1; i++) {
			
			suggest += '<div id="learning_units' +i.toString() +'" ';
			suggest += 'onmouseover="javascript:suggestOver(this);" ';
			suggest += 'onmouseout="javascript:suggestOut(this);" ';
			suggest += 'onclick="javascript:setLink(this.innerHTML);" ';
			suggest += 'class="suggest_link">';
			suggest += str[i] + '</div>';			
			
		}
		
				   
	    $("#article_suggest").html(suggest);
	    ss.style.visibility='visible';	    
	
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
function setLink(value) {
	document.getElementById('article_field').value = value;
	document.getElementById('article_suggest').innerHTML = '';
	document.getElementById('article_suggest').style.visibility='hidden';
}


