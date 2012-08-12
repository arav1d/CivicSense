<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>
<link type="text/css" href="css/citizen.css" rel="stylesheet"/>
<link type="text/css" href="css/jquery.toastmessage.css" rel="stylesheet"/>
<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.tools.min.js"></script>
<script type="text/javascript" src="scripts/jquery.toastmessage.js"></script>
<script type="text/javascript" src="scripts/jquery.tagcloud.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.all.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.selectable.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.position.js"></script>

<script type="text/javascript" src="scripts/search.js"></script>
<script language="javascript">
<%response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

%>
var tval = 0;
var count = -8;
var cid;

/*
$( "#comptile" ).selectable({
	   selected: function() { var oldcontainer=document.getElementById("cdesc");
	   var olddiv =  oldcontainer.childNodes[3];
	   $(olddiv).fadeOut('slow');
	   cid = this.getAttribute("id");
	   loadcomp(this.getAttribute("id"),olddiv); }
	});
*/

function changestatus(obj)
{
	
	/*if(obj.textContent == "support")
	    $(obj).button("option","label","supported");
	else
		$(obj).button("option","label","support");
	*/xobj = new XMLHttpRequest();
	xobj.open("GET","CitizenView?number="+cid+"&type=support",false);
	xobj.onreadystatechange = function(){
		if(xobj.readyState == 4 && xobj.status == 200)
		{
			var a = xobj.responseText;
			
			obj = document.getElementById("support");
			$(obj).button("option","label",a+" supports");
			obj.disabled=true;
		}
	};
	xobj.send();

}

function shownext()
{
	var clist = document.getElementById("comptile");
	if(count != 304)
	count = count + 8;
	else
		return;
	var number = count;
	xobj = new XMLHttpRequest();
	xobj.open("GET","CitizenView?number="+number+"&type=tile&nav=next",false);
	xobj.onreadystatechange = function(){
		if(xobj.readyState == 4 && xobj.status == 200)
		{	if(xobj.responseText=='0')
			{
			clist.innerHTML="<li style='color:white;'>NO COMPLAINTS TO DISPLAY!</li>";
			}
			else
			clist.innerHTML = xobj.responseText;
		//document.getElementById("compdesc").display="none";
		}

	};
	xobj.send();

	}
	function showprev()
	{
		var clist = document.getElementById("comptile");
		if(count > 0)
		count = count - 8;
		else
			return;
		var number = count;
		xobj = new XMLHttpRequest();
		xobj.open("GET","CitizenView?number="+number+"&type=tile&nav=prev",false);
		xobj.onreadystatechange = function(){
			if(xobj.readyState == 4 && xobj.status == 200)
			{	
				if(xobj.responseText=='0')
					clist.innerHTML="<li style='color:white;'>NO COMPLAINTS TO DISPLAY!</li>";
					else
					clist.innerHTML = xobj.responseText;	
				//document.getElementById("compdesc").display="none";
			}
		
		};
		xobj.send();
	}
/*
function prep()
{
	var clist = document.getElementById("comptile");
	var nowclass;
	for(i = 1;i < clist.childNodes.length;i = i + 2)
	{
		nowclass = clist.childNodes[i];
		nowclass.setAttribute("isthere","flase");
		
	}
}

function populate()
{
	var clist = document.getElementById("comptile");
	var cdesc = document.getElementById("cdesc");
	var newdiv;
	var content;
	var nowclass;
	var i;<form id="search_form" action="#" method="
	for(i = 1;i < clist.childNodes.length;i = i + 2)
	{
		nowclass = clist.childNodes[i];
		if(nowclass.getAttribute("class") == "ui-state-default ui-selectee ui-selected" && nowclass.getAttribute("isthere") != "true")
		{
			nowclass.setAttribute("isthere","true");
			newdiv = document.createElement('div');
			newdiv.setAttribute("class","inside");
			content = "<p>street/date</p><p style='float:right;'>feedback_type</p><br/><p style='text-align:center;'>complaint_desc</p><button style='float:left;' onclick='changestatus(this)'>support</button><div class='feedback' style='float:right;'><div class='toggle' style='float:right;'><input type='radio' value='pos' name='feedback' id='radio2'/><label for='radio1' style='font-size:10px'>positive</label><input type='radio' value='neg' name='feedback' id='radio1'/><label for='radio2' style='font-size:10px'>negative</label></div><p>Your feedback :<textarea rows=4 cols=60></textarea></p><button id='post' style='float:right;' onclick='postfeedback(this)'>post</button></div><br/>"
			newdiv.innerHTML = content;
			$( ".selector" ).selectable({
				   selected: function(event, ui) { ... }
				});
		}
	}
}
*/




function populate(val)
{
var oldcontainer=document.getElementById("cdesc");
var olddiv =  oldcontainer.childNodes[3];
$(olddiv).fadeOut('slow');
cid = val.getAttribute("id");
loadcomp(val.getAttribute("id"),olddiv);
}

function loadcomp(number,olddiv)
{
	var s = "a";
	
	xobj = new XMLHttpRequest();
	xobj.open("GET","CitizenView?number="+number+"&type=complaint",false);
	xobj.onreadystatechange = function(){
		if(xobj.readyState == 4 && xobj.status == 200)
		{
			s = xobj.responseText;
			prep(s,olddiv);
		}};
	xobj.send();
}
function prep(a,nowclass)
{
	//var clist = document.getElementById("cdesc");
	//var nowclass = clist.childNodes[3];
	//a = "street/date,positive,2,in process[a01],health complaint,The best complaint !"
	//a = "street/date,null,2,in process[a01],health complaint"
	document.getElementById("compdesc").style.display = "block";
	var s = a.split(',');
	nowclass.childNodes[1].innerHTML = "<br/><span style='font-variant:small-caps;'>Street/Date:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[0];//street/date 
	if(s[1] == "null"){nowclass.childNodes[2].innerHTML = "<span style='font-variant:small-caps;'>Feedback Type:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "no feedback given !";}
	else
		nowclass.childNodes[2].innerHTML = "<br/><span style='font-variant:small-caps;'>Feedback Type:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + s[1];//feedback_type 
	if(s[2] == "1")
		nowclass.childNodes[4].style.color = "red";
	else if(s[2] == "2")
		nowclass.childNodes[4].style.color = "green";// s[2] gives the level of complaint process
	else
		nowclass.childNodes[4].style.color = "lightblue";
	nowclass.childNodes[4].innerHTML = "<br/><span style='font-variant:small-caps;'>Complaint status:</span><br/><span style='float:left;margin:10px;'>" + s[3] + "</span>";//Complaint_status[authority id]
	nowclass.childNodes[8].innerHTML = "<br/><span style='font-variant:small-caps;'>Complaint Description:</span><br/><span style='text-align:center;float:left;margin:10px;'>" + s[4] +"</span>"; //Complaint_desc
	nowclass.childNodes[12].setAttribute("value",s[5]); //complaint id for setting feedback value 
	//document.getElementById("compdesc").display="inline";
	var content = 	"<p style='color:#65b8f9;font-size:20px;margin:10px'><br/>Feedback :</p><br/><p style='font-size:15px;color:#65b250;margin:15px;'><br/>" + s[9]+"</p>"; 
	if(s[1] != 'null')
		{
		//nowclass.childNodes[12].innerHTML = content;//feedback string
		nowclass.childNodes[12].style.display = "none";
		document.getElementById("feed").innerHTML = content;
		}
		else if(s[6] == "false" && s[1] == 'null')
		{
		 //nowclass.childNodes[12].innerHTML = "<p style='color:#65b8f9;font-size:16px'>Feedback :</p><br/><p style='font-size:14px;color:#65b250'>No feedback posted</p>";
			nowclass.childNodes[12].style.display = "none";
			document.getElementById("feed").innerHTML = "<p style='color:#65b8f9;font-size:16px'><br/>Feedback :</p><br/><p style='font-size:14px;color:#65b250'><br/>No feedback posted</p>";
		}
		 else if(s[6] == "true" && s[1]=='null')
			{
			 nowclass.childNodes[12].style.display = "inline";
			 document.getElementById("text").value="";
			 document.getElementById("feed").innerHTML="";
			}
			
			
		if(s[7]=='disable')
		{
		 obj = document.getElementById("support");
			$(obj).button("option","label",s[8]+" supports");
			obj.disabled=true;
		}
		else
		{

			 obj = document.getElementById("support");
				$(obj).button("option","label",s[8]+" supports");
				obj.disabled=false;
		}
	//cdesc.appendChild(nowclass);
	$(nowclass).fadeIn('slow');
}

function gettree()
{
	var clist = document.getElementById("comptile");
	var s = "";
	var t = "";
	var u = "";
	var i,j,k;
	for(i=0;i < clist.childNodes.length;i = i+1)
	{
	 s += "\n"+i+clist.childNodes[i].getAttribute("class");
	 	for(j = 1;j<clist.childNodes[i].childNodes.length;j = j + 1){
	 		t += "\n"+i+j+clist.childNodes[i].childNodes[j];
	 		if(clist.childNodes[i].childNodes[j].textContent != undefined)t +=clist.childNodes[i].childNodes[j].textContent;
	 		for(k = 1;k < clist./*else
			{

			returnString.append("<li class='ui-state-default' id=''>"+			
					"</li>");
		}*/childNodes[i].childNodes[j].childNodes.length; k++ )
	 			u += "\n"+i+j+k+clist.childNodes[i].childNodes[j].childNodes[k];
	 		if(clist.childNodes[i].childNodes[j].childNodes[k] != undefined)u +=clist.childNodes[i].childNodes[j].childNodes[k].textContent;
	 	}
	 	alert(t);
	}
	alert(s);
}
function pop()
{
document.getElementById("message-dialog").style.display = "inline";
$( function(){ $("#dialog:ui-dialog").dialog("destroy");
$( "#dialog-message" ).dialog({model:true,buttons:{Ok:function(){$(this).dialog("close");
}
}
});
});
}
function postfeedback(obj)
{
	if(obj.parentNode.childNodes[3].childNodes[1].value=="" || (document.getElementById("radio1").checked==false && document.getElementById("radio2").checked==false))
		put();
 //var content = obj.parentNode.childNodes[3].childNodes[1].value;
 var content = document.getElementById("text").value;
 var number = obj.parentNode.getAttribute("value");
 var tog;
 if(document.getElementById("radio1").checked)
	 tog="pos";
 else 
	 tog="neg";
 obj.parentNode.style.float = "left";
obj.parentNode.style.display="none";
 document.getElementById("feed").innerHTML = "<p style='color:#65b8f9;font-size:16px'>Feedback :</p><br/><p style='font-size:12px;color:#65b250'>"+content;
 xobj = new XMLHttpRequest();
	xobj.open("GET","CitizenView?number="+number+"&type=feedback&value="+content.trim()+"&toggle="+tog,true);
	xobj.onreadystatechange = function(){
		if(xobj.readyState == 4 && xobj.status == 200)
		{
			s = xobj.responseText;
		}};
	xobj.send();
}
	$(document).ready(function(){$("#cdesc").toastmessage('showToast', {
	       text     : 'Click the tiles<br/>above to view the complaint status !<br/>',
	       sticky   : false,
	       stayTime : 6000,
	       position : 'middle-left',
	       type     : 'notice'
    });
});

	$(function() {
		$( "#citizenoptions" ).accordion({
			collapsible: true
		});
	});
		
	
	
$(function() {
	$( "#comptile" ).selectable();
});

$(function() {
	$( ".inside .feedback .toggle" ).buttonset();
});
$(function() {
	$( ".alternative button" ).button();});



$(function(){$( "#comptile" ).bind( "selectableselected", function(){
	var oldcontainer=document.getElementById("cdesc");
	var olddiv =  oldcontainer.childNodes[3];
	cid = document.getElementsByClassName("ui-selected").item(0).getAttribute("id");
	$(olddiv).fadeOut('slow');
	loadcomp(cid,olddiv);
});
});


$(document).ready(function(){ if(tval == 1){tval = 0;$().toastmessage('showToast', {
    text     : "Suggestion posted<br/> <strong>successfully!</strong><br/>You can view it<br/>in your next login.",
    sticky   : false,
    stayTime : 7000,
    type     : 'success'
 });};
});

$.fn.tagcloud.defaults = {
		  size: {start: 10, end: 20, unit: 'px'},
		  color: {start: '#6699ff', end: '#ffffff'}
		};

$(function () {
	$('#whatever a').tagcloud();
});

$(function() {
	 
    // if the function argument is given to overlay,
    // it is assumed to be the onBeforeLoad event listener
    $("a[rel]").overlay({
 
        mask: 'steelblue',
        effect: 'apple',
 
        onBeforeLoad: function() {
        	$("#overlay").show();
            // grab wrapper element inside content 
            var wrap = this.getOverlay().find(".contentWrap");
 
            // load the page specified in the trigger
            wrap.load(this.getTrigger().attr("href"));
        }
 
    });
});



</script>
<style>
	#feedback { font-size: 1.4em; }
	#comptile .ui-state-default { background: #75A3FF; }
	#comptile .ui-selecting { background: #C8DAFF; }
	#comptile .ui-selected { background: #7ACC7A; color: black; }
	#comptile { list-style-type: none; margin: 0; padding: 0;float:left; }
	#comptile li { margin: 3px; padding: 1px; float: left; width: 105px; height: 90px; font-size: 10px; text-align: center; }
</style>


<title>CivicSense|CitizenHome</title>
</head>
<div id="dialog-message" title="Feedback" style="display:none">
<p>
Please provide with the feedback description<br/>
and type of the feedback to be specified 
</p>
</div>
<body onload="shownext();">
<%--<body onload="prep('a',document.getElementById('cdesc').childNodes[3])">--%>
<%if(request.getAttribute("sugmsg") != null) { %>
<script>
tval = 1;
</script>
<%request.setAttribute("sugmsg", null); } %>
	<div id="wrapper">
		<div id="header">
			<p><strong style="color:white;">Welcome</strong>&nbsp;&nbsp;<span style="color:#75A3FF;">${user.fname}&nbsp;&nbsp;[${user.location.zone }&nbsp;&nbsp; |&nbsp;&nbsp; ${user.location.ward }]</span></p>
			<ul>
				<li class="no_bg"><a href="citizenHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
				</ul>
		</div>
		<a href="citizenHome.jsp" id="logo" title="civic sense"></a>
		
		<div id="sl" style="display:none;" onclick="this.style.display = 'none';" > </div>
		<div id="content">
			<div id="left_column">
				<div class="text">
					<h2>Complaint Tile</h2><br/><br/><br/>
			<ol id="comptile" >
				<li class="ui-state-default" >dept<br/>date<br/><br/><span style='color:#FCFCFC;'>Support:  <strong>suport</strong></span><br/><span style='color:#FCFCFC;'>Street: street</span><br/></li>
				<li class="ui-state-default" >dept<br/>date<br/><br/><span style='color:#FCFCFC;'>Support:  <strong>suport</strong></span><br/><span style='color:#FCFCFC;'>Street: street</span><br/></li>
				<li class="ui-state-default" >dept<br/>date<br/><br/><span style='color:#FCFCFC;'>Support:  <strong>suport</strong></span><br/><span style='color:#FCFCFC;'>Street: street</span><br/></li>
				<li class="ui-state-default" >dept<br/>date<br/><br/><span style='color:#FCFCFC;'>Support:  <strong>suport</strong></span><br/><span style='color:#FCFCFC;'>Street: street</span><br/></li>
				<li class="ui-state-default" >dept<br/>date<br/><br/><span style='color:#FCFCFC;'>Support:  <strong>suport</strong></span><br/><span style='color:#FCFCFC;'>Street: street</span><br/></li>
				<li class="ui-state-default" >dept<br/>date<br/><br/><span style='color:#FCFCFC;'>Support:  <strong>suport</strong></span><br/><span style='color:#FCFCFC;'>Street: street</span><br/></li>
				<li class="ui-state-default" >dept<br/>date<br/><br/><span style='color:#FCFCFC;'>Support:  <strong>suport</strong></span><br/><span style='color:#FCFCFC;'>Street: street</span><br/></li>
				<li class="ui-state-default" >dept<br/>date<br/><br/><span style='color:#FCFCFC;'>Support:  <strong>suport</strong></span><br/><span style='color:#FCFCFC;'>Street: street</span><br/></li>
		   </ol>
		   		
				<div id="next" style="float:right;margin-left:10px;"><a href="#" onclick="shownext()"><img src="images/right.jpg" /></a></div>
				<div id="prev" style="float:right;"><a href="#" onclick="showprev()"><img src="images/left.jpg"/></a></div>
				</div>
				<%--
				<div class=" text alternative">
					<h2>Form groups</h2>
						<p><img src="images/group.jpg" alt="group"/>Groups can be formed here
						</p>
						<a href="#" class="continue">Form a group</a>
				</div>
				--%>
				<div class=" text alternative" id="cdesc">
					<h2>The Complaint</h2>
					<%-- 
					<div class="inside">
						<p>street/date</p><p style="float:right;">feedback_type</p>
						<p>Complaint status[Authority id]</p>
						<br/>
						<p style="text-align:center;">complaint_desc</p>
						<button style="float:left;" onclick="changestatus(this)">support</button>
						<div class="feedback" style="float:right;">
						 	<div class="toggle" style="float:right;">
							<input type="radio" value="pos" name="toggle" id="radio2"/><label for="radio1" style="font-size:10px">positive</label>
							<input type="radio" value="neg" name="toggle" id="radio1"/><label for="radio2" style="font-size:10px">negative</label>
							</div>
 						<p>
  							Your feedback :
  							<textarea rows=4 cols=60></textarea>
 						</p>
							<button id="post" style="float:right;" onclick="postfeedback(this)">post</button>
						</div>
						<br/>
						</div>
						--%>
						<div class="inside" id="compdesc" style="display:none;">
						<p style="margin-left:3px;margin-top:3px;font-size:15px;"></p><p style="float:right;font-size:15px;"></p>
						<p style="font-size:15px;margin-left:3px;margin-top:3px;"></p>
						<br/>
						<p style="font-size:15px;"></p>
						<button id="support" style="float:left;margin:10px;" onclick="changestatus(this)">support</button>
						<div class="feedback" style="float:right;">
						 	<div class="toggle" style="float:right;">
							<input type="radio" value="pos" name="toggle" id="radio2"/><label for="radio1" style="font-size:15px">positive</label>
							<input type="radio" value="neg" name="toggle" id="radio1"/><label for="radio2" style="font-size:15px">negative</label>
							</div>
 						<p>
  							<span style="font-size:15px;float:left;margin:10px;">Your feedback :</span>
  							<textarea id="text" style="float:left;margin:10px;" rows=4 cols=60></textarea>
 						</p>
							<button id="post" style="float:right;" onclick="postfeedback(this)" >post</button>
						</div>
						
						<label id="feed" style="font-size:15px;"></label>
						</div>
				</div>
				<div class="text">
					<h2>More on Citizen</h2>
						<p>Let's know about your 
						suggestions and opinions </p>
						<a href="Suggestion" class="continue">Make a difference</a>
						
						<p style="margin:10px;">Some simple tips to use the Citizen account</p>
						<a href="citizentc.html" class="continue" rel="#overlay" style="text-decoration:none">Tips to Citizens</a>
						<div class="apple_overlay" id="overlay" style="display:none;">
							<div class="contentWrap"></div>
						</div> 
				</div>
			</div>
					
			<div id="right_column">

<div id="citizenoptions">
	<h3><a href="#">Complaint</a></h3>
	<div>
		<p><a href="CitizenComplaint" style="font-size:14px;color:#65b8f9;">File your complaints here</a></p>
		<br/>
		<br/>
		<p><a href="mycomplaints.jsp" style="font-size:14px;color:#65b8f9;">My Complaints</a></p>
		<br/>
		<br/>
		<p><a href="citizenHome.jsp" style="font-size:14px;color:#65b8f9;">View the complaints pertaining to your area</a></p>
	</div>
	<h3><a href="#">Groups</a></h3>
	<div>
		<p><span style="font-size:14px;color:#65b8f9;">Groups in your area:</span></p>
		<br/>
		<%@ page import="java.util.*"%>
		<%@ page import="entity.Group" %> 
		<% String group=session.getAttribute("groups1").toString();
		if(group.equals("no groups"))
		{%>
			<br/><span style="font-size:14px;color:#65b8f9;">No Groups</span>
		<% }
		else{
		@SuppressWarnings("unchecked")
		List<Group> grp =(List<Group>) session.getAttribute("groups")  ;
		if(grp!=null  && !grp.isEmpty())	{%>
		
	<%		for(int i = 0;i < grp.size(); ++i){		%>
	<br/><p><a href="GroupHandle?value=<%= grp.get(i).getGroupId() %> "style="text-decoration:none;" ><%= grp.get(i).getName() %></a></p>
	<%} }}%>
	</div>
	<h3><a href="#">Suggestion</a></h3>
	<div>
		<p><a href="suggestionForm.jsp" style="font-size:14px;color:#65b8f9;">Post your suggestions</a></p>
		<br/>
		<br/>
		<p><span style="font-size:14px;color:#65b8f9;">Suggestions from your area:</span></p>
		<br/>
		<%@ page import="entity.Suggestion" %> 
		<% 
		//@SuppressWarnings("unchecked")
			//List<Suggestion> gp2 =(List<Suggestion>) session.getAttribute("suggestions")  ;
		String suggestion=session.getAttribute("suggestions1").toString();
		if(suggestion.equals("no suggestions"))
		{%>
			<br/><span>No Suggestions</span>
		<% }
		else{%>
		<%@ page import="entity.Suggestion" %> 
		<% @SuppressWarnings("unchecked")
			List<Suggestion> gp2 =(List<Suggestion>) session.getAttribute("suggestions")  ;
				if(!gp2.isEmpty() && gp2!=null)	{
		for(int j = 0;j < gp2.size(); ++j){		%>
		<br/><p><a href="SuggestionHandle1?value=<%= gp2.get(j).getSuggestionId() %>" style="text-decoration:none;" ><%= gp2.get(j).getDesc().substring(0, 20) %> ...</a></p>
		<%} } }%>
		
		
	</div>
		
</div>


                <%--
                <div id="selection">
				<ul>
					<li class="active"><a href ="#">Citizen</a></li>
					<li><a href="#">Authority</a></li>
					<li><a href="#">Admin</a></li>
					<li><a href="#">NGO</a></li>
				</ul>
				</div>
                --%>
            	 <div class="heading">
                	<h2>Citizen and Civic Sense</h2>
                </div>  
                    	<div id="whatever">
  							<a href="#" rel="7">Export as PDF</a>
  							<a href="#" rel="3">Automated Mail</a>
  							<a href="#" rel="10">Complaint Tile</a>
  							<a href="#" rel="5">Feedback system</a>
  							<a href="#" rel="6">Groups</a>
  							<a href="#" rel="2">Suggestion</a>
						</div>	
                <div class="heading">
                	<h2>Citizen can</h2>
                </div>
                	<ul>
            			<li><span>File Complaints</span>&nbsp;Using complaint forms</li>
                        <li><span>Provide suggestions</span>&nbsp;Reforms the system</li>
                        <li><span>Support complaints</span>&nbsp;belonging to their area</li>
                        <li><span>Discuss</span>&nbsp;in the Groups by NGOs</li>
            		</ul>
                
               
                <!-- </div> 
                	<ul>
            			<li><span>Cleanliness day</span>&nbsp; Celebration and messages</li>
                        <li><span>Stamp paper scams</span>&nbsp; Beware of the false stamps</li>
            		</ul>
				</div>
				-->
		
	</div>
	</div>
	</div>
	
	<div id="footer">
		<div id="footer_content">
			<ul>
				<li class="no_bg"><a href="citizenHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
			<p> &copy; 2012 Civic Sense - Team. All wrongs unreserved. </p>
		</div>
	</div>
</body>
</html>