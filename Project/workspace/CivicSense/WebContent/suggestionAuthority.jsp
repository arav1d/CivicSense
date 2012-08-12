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
</style>

<script>
	$(function() {
		$( "input:submit").button();
		$( "input:button").button();
		$( "input:reset").button();
		$("button").button();
	});
	
	$(function() {
		$( "#citizenoptions" ).accordion({
			collapsible: true
		});
		$( "#citizenoptions" ).accordion('activate',2);
	});
</script>

<script type="text/javascript">







function ajax_call(id)
{
	var xhr=new XMLHttpRequest();
	alert(id);
	//creating a new XMLHttpReuest
	//xhr.open("GET","AJAX?suggid="+id+"&type=suggsupp",false);
	xhr.open("GET","AJAX?suggid="+id+"&type=suggsupp",true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200)
		{
			result=xhr.responseText;//getting the response text and parsing to int
			alert(result);
			 document.getElementById("support").innerHTML=result+"Supports";
			 alert("set");
			}};
			xhr.send();
}


$.fn.tagcloud.defaults = {
		  size: {start: 10, end: 20, unit: 'px'},
		  color: {start: '#6699ff', end: '#ffffff'}
		};

$(function () {
	$('#whatever a').tagcloud();
});

</script>



</head>

<body>
<div id="wrapper">
		<div id="header">
			<p><span>Contact:</span> <strong>Toll Free 1800-000-000</strong></p>
			<ul>
				<li class="no_bg"><a href="authorityHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
		</div>
		<a href="authorityHome.jsp" id="logo" title="civic sense"></a>
		<div id="navigation">
			<span>Suggestion Description</span>
		</div>
		<div id="content">
		<form id="regform">
				<div class="text">
					<h2>Suggestion Details</h2>
						<table class="table" width="100%" style="overflow:auto;">
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
				
				
		</form>
				<div id="right_column">
			<div id="citizenoptions">
	<h3><a href="#">Complaint</a></h3>
	<div>
		<p><a href="authorityHome.jsp" style="font-size:14px;color:#65b8f9;">View the complaints to handle</a></p>
	</div>
	<h3><a href="#">Memo</a></h3>
	<div>
		<p><span style="font-size:14px;color:#65b8f9;">Memos received:</span></p>
		<br/>
		<%@ page import="java.util.List" %>
		 <%String memo=(String)session.getAttribute("memos1");
		if(memo.equals("no memos"))
		{%>
			<br/><span>No Memos</span>
		<% }
		else{%>
		<%@ page import="entity.Memo" %> 
		<% @SuppressWarnings("unchecked")
			List<Memo> gp1 =(List<Memo>) session.getAttribute("memos")  ;
				if(!gp1.isEmpty())	{
		 	for(int j = 0;j < gp1.size(); ++j){		%>
		<br/><a href="Memo?value=<%= gp1.get(j).getMemoId() %> "style="text-decoration:none;" ><%= gp1.get(j).getDesc().substring(0,20) %> ...</a>
		<%}}}%>
	</div>
	<h3><a href="#">Suggestion</a></h3>
	<div>
		<p><span style="font-size:14px;color:#65b8f9;">Suggestions from your area:</span></p>
		<br/>
		<%@ page import="java.util.*"%>
		<%@ page import="entity.Suggestion" %> 
		<% String suggestion=(String)session.getAttribute("suggestions1");
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
		<br/><p><a href="SuggestionHandle2?value=<%= gp2.get(j).getSuggestionId() %>" style="text-decoration:none;" ><%= gp2.get(j).getDesc().substring(0,20) %> ...</a></p>
		<%} } }%>
	</div>
</div>

			
			
				<div class="heading">
                	<h2>Authority and Civic Sense</h2>
                </div>
                    	<div id="whatever">
  							<a href="#" rel="7">Process Levels</a>
  							<a href="#" rel="3">Automated memo mail</a>
  							<a href="#" rel="10">Complaint Scroll</a>
  							<a href="#" rel="5">Memo export as PDF</a>
  							<a href="#" rel="6">Credits</a>
  							<a href="#" rel="2">Suggestions</a>
						</div>	
                <div class="heading">
                	<h2>Authority can</h2>
                </div>
                	<ul>
            			<li><span>Handle complaints</span>&nbsp;Using complaint scroll</li>
                        <li><span>Change Process levels</span>&nbsp;to update the status</li>
                        <li><span>Invalidate improper complaints</span>&nbsp;previlege to authority</li>
                        <li><span>View Memos</span>&nbsp;sent by Administrators</li>
                        <li><span>View Suggestions</span>&nbsp;posted by users</li> 
            		</ul>
			</div>
			
			</div>
			
			
		
		
		</div>


<div id="footer">
		<div id="footer_content">
			<ul>
				<li class="no_bg"><a href="index.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>

			</ul>
			<p> &copy; 2012 Civic Sense - Team. All wrongs unreserved. </p>
		</div>
	</div>
</body>
</html>