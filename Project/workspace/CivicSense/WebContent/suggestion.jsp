<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="css/reg_style_new.css" rel="stylesheet">
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet">
<script type="text/javascript" src="scripts/search.js"></script>
<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.tagcloud.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>

<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<title>CivicSense | Suggestion</title>

<style type="text/css">
sup{color:red;}
.label{color:red;}
.table{background-color:lightblue;}
.table{resize:none;}
#desc{resize:none;}
.post{background-color:lightgreen;}
#newpost{resize:none;}
</style>

<script>
	$(function() {
		$( "input:submit").button();
		$( "input:button").button();
		$( "input:reset").button();
		$("#support").button();
	});
	
	$(function() {
		$( "#citizenoptions" ).accordion({
			collapsible: true
		});
		$( "#citizenoptions" ).accordion('activate',2);
	});
	
	$.fn.tagcloud.defaults = {
			  size: {start: 10, end: 20, unit: 'px'},
			  color: {start: '#6699ff', end: '#ffffff'}
			};

	$(function () {
		$('#whatever a').tagcloud();
	});
	
</script>

<script type="text/javascript">







function ajax_call(id)
{
	var xhr=new XMLHttpRequest();
	//creating a new XMLHttpReuest
	//xhr.open("GET","AJAX?suggid="+id+"&type=suggsupp",false);
	xhr.open("GET","AJAX?suggid="+id+"&type=suggsupp",true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200)
		{
			result=xhr.responseText;//getting the response text and parsing to int
			obj = document.getElementById("support");
			$(obj).button("option","label",result+" supports");
			obj.disabled=true;
			}};
			xhr.send();
}


function sugload(sup,status)
{
	obj = document.getElementById("support");
	$(obj).button("option","label",sup+" supports");
	if(status=='enable')
	obj.disabled=false;
	else
		obj.disabled=true;
	
}

</script>



</head>

<body onload = "sugload('${suggestion.support}','${support }')">
<div id="wrapper">
		<div id="header">
			<p><span>Contact:</span> <strong>Toll Free 1800-000-000</strong></p>
			<ul>
				<li class="no_bg"><a href="citizenHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
		</div>
		<a href="citizenHome.jsp" id="logo" title="civic sense"></a>
		
				<div id="sl" style="display:none;" onclick="this.style.display = 'none'"></div>
		<div id="navigation">
			<span>Suggestion Description</span>
		</div>
		<div id="content">
		<div id="regform">
				<div class="text">
					<h2>Suggestion Details</h2>
						<table class="table" width="100%"style="overflow:auto;">
						<tr>
						<td>Suggestion Id:</td>
						<td><label  id="id">${suggestion.suggestionId}</label></td>
						</tr>

						<tr>
						<td>Posted By:</td>
						<td><label  id="creator">${suggestion.citizen.fname}&nbsp;&nbsp;${suggestion.citizen.lname}</label></td>
						</tr>
						<tr>
						<td>Responsible Authority:</td>
						<td><label  id="auth">${suggestion.authority.fname}&nbsp;&nbsp;${suggestion.authority.lname}</label></td>
						</tr>
						
						<tr>
						<td>Posted On:</td>
						<td><label  id="date">${suggestion.date}</label></td>
						</tr>
						
						<tr>
						<td>Department:</td>
						<td><label  id="dept">${suggestion.authority.dept}</label></td>
						</tr>
						
						<tr>
						<td>Description:</td>
						<td id = "desc">${suggestion.desc}</td>
						</tr>
						</table>
						</div>
						
						
						<div class="text" >
						<h2>Suggestion Location Details</h2>
                         <table class="table" width="100%">
                        <tr>
						<td>Zone:</td>
						<td><label  id="zone">${suggestion.location.zone}</label></td>
						</tr>
						
						<tr>
						<td>Ward:</td>
						<td><label  id="ward">${suggestion.location.ward}</label></td>
						</tr>
						</table>
				</div>
				
				<div class="text">
				<button  id="support" onclick="ajax_call(${suggestion.suggestionId})">${suggestion.support}&nbsp;Supports</button>
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
			<span style="font-size:14px;color:#65b8f9;">No Groups</span>
		<% }
		else{
		@SuppressWarnings("unchecked")
		List<Group> grp =(List<Group>) session.getAttribute("groups")  ;
		if(grp!=null  && !grp.isEmpty())	{%>
		
	<%		for(int i = 0;i < grp.size(); ++i){		%>
	<br/><p><a href="GroupHandle?value=<%= grp.get(i).getGroupId() %> "style="text-decoration:none;" ><%= grp.get(i).getName() %></a></p>
	<%} }}%>
		<br/>
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