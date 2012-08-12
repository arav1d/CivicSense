 
function suggest(val)
{
	var slist = document.getElementById("sl");
	if(val.length == 0){
		slist.style.display = "none";
		return;
	}
	else{
	slist.style.display = "inline";
	xobj = new XMLHttpRequest();
	xobj.open("GET","AJAX?searchbox="+val+"&type=search",true);
	xobj.onreadystatechange = function(){
		
		if(xobj.readyState == 4 && xobj.status == 200)
		{
			slist.innerHTML = xobj.responseText;
		}
	};
	xobj.send();
	
	}
}
function fill(suggestion)
{
	var tfield = document.getElementById("search_form");
	tfield.elements["searchbox"].value = suggestion;
}