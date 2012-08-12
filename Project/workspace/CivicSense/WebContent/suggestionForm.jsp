<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="css/reg_style.css" rel="stylesheet">
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet">
<script type="text/javascript" src="scripts/search.js"></script>
<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.tagcloud.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<title>CivicSense|PostSuggestion</title>
<style type="text/css">
/*h1{text-align:center;background-color:lightgreen}
h4{text-align:center;color:darkblue}
h3{background-color:lightgreen}*/
h5{color:red;}
.table{background-color:lightblue}
sup,.label{color:red;}
#sploc,#suggdesc{resize:none;}
</style>

<script type="text/javascript">

$(function() {
	$( "input:submit").button();
	$( "input:reset").button();
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

<title>Citizen Suggestion Form</title>

<script type="text/javascript">

function check_sploc()
{
var sploc=document.getElementById("sploc");
var sploclabel=document.getElementById("sploclabel");
var pattern=/^[ \na-zA-Z0-9.,-/]+$/;
if(sploc.value=="")
 sploclabel.innerHTML="cannot be empty";
else if(!sploc.value.match(pattern))
 sploclabel.innerHTML="cannot contains special characters other than ,.-/";
else if(sploc.value.length>300)
	sploclabel.innerHTML="cannot exceed more than 300 characters";
else
sploclabel.innerHTML="";
}


function check_category()
{
	var suggestion_category=document.getElementById("suggestion_category");	
	var suggestion_categorylabel=document.getElementById("suggestion_categorylabel");
	if(suggestion_category.value==0)
		suggestion_categorylabel.innerHTML="select your suggestion department";
	else
		suggestion_categorylabel.innerHTML="";
}


function check_desc()
{
var suggdesc=document.getElementById("suggdesc");
var suggdesclabel=document.getElementById("suggdesclabel");
var pattern=/^[ \na-zA-Z0-9,-./]+$/;
if(suggdesc.value=="")
 suggdesclabel.innerHTML="cannot be empty";
else if(!suggdesc.value.match(pattern))
suggdesclabel.innerHTML="cannot contain special characters other than ,.-/";
else if(suggdesc.value.length>300)
	suggdesclabel.innerHTML="cannot exceed more than 300 characters";
else if(suggdesc.value.length<20)
	suggdesclabel.innerHTML="should be atleast 20 characters in length";
else
	 suggdesclabel.innerHTML="";
}



function validate()
{
var labels=document.getElementsByClassName("label");
check_desc();
check_category();
check_sploc();
for(var i=0;i<labels.length;i++)
		{
		if(labels[i].innerHTML!="")
			return false;
		}
		return true;
}


//this function clears the fields
function reset_fields()
{
var sploc=document.getElementById("sploc");
var combo1=document.getElementById("complaint_category");
var desc=document.getElementById("desc");
var title=document.getElementById("title");

title.value="";
desc.value="";
sploc.value="";
combo1.options[0].selected=true;
}

</script>



</head>

<body>
<div id="wrapper">
		<div id="header">
			<p><span>Contact:</span> <strong>Toll Free 1800-000-000</strong></p>
			<ul>
				<li class="no_bg"><a href="citizenHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
		</div>
		<a href="citizenHome.jsp" id="logo" title="civic sense"></a>
		
		
<%-- ----------------------------------------------Title--------------------------------------------------- --%>		
		<div id="navigation">
			<span>Post a Suggestion/Petition</span>
		</div>
		<div id="content">
		
			<form id="regform" action="Suggestion" method="post">
				<h3 style="color:#91bff9;">Instructions: Please fill your Petition details below and click the 'Post Suggestion' button at the bottom. 
								<br />(<sup>*</sup>indicates required fields)</h3><br/>
				<h3 style="color:#91bff9;">Please make use of html tags to format your suggestions! [&nbsp;&nbsp;&lt;p&gt;,&lt;br&gt;,&lt;b&gt;,&lt;i&gt;&nbsp;&nbsp;] </h3>								
				<hr />
				<h4 style="color:#f14a1d;">Note:Please note that you can post suggestions only related to your Ward within ur Zone</h4>	
				<div class="text">
					<h2>Suggestion Location Details</h2>
<%-- ----------------------------------------------------Location Details------------------------------------------------- --%>
					<table class="table" width="100%">

					<tr>
					<td>Zone where you live: </td>
					<td><input type="text" readonly size="30" name="zone" id="zone" value="${location.zone}"/></td>
					</tr>


					<tr>
					<td>Ward you belong to: </td>
					<td><input type="text" readonly size="30" name="ward" id="ward" value="${location.ward}" /></td>
					</tr>

								
					
					</table>

				</div>
				<div class=" text alternative">
					<h2>Suggestion Type</h2>
<%-----------------------------------------Complaint Types-------------------------------------------------%>

					<table width="100%" class="table">
					<tr>

					<td>Suggestion Category:<sup>*</sup></td>
					<td>
					<select style="width:200" id="suggestion_category" name="dept" onchange="check_category()">
					
					<option   value ="0" >-- Choose-- </option>
					<option value="Health">Health</option>
					<option value="General">General</option>
					<option value="Engineering">Engineering</option>
					<option value="Revenue">Revenue</option>
					<option value="Solid Waste Management">Solid Waste Management</option>
					</select>
					</td>
					</tr>
					
					<tr>
					<td></td>
					<td><label class="label" id="suggestion_categorylabel"></label></td>
					</tr>
					
					
					</table>
				</div><div id="sl" style="display:none;" onclick="this.style.display = 'none'"></div>
				<div class="text">
					<h2>Suggestion Description</h2>
					
					
					<table class="table"  width="100%">
					
					
					
					<tr>
					<td>Suggestion Description:<sup>*</sup></td>
					<td><textarea id="suggdesc" onchange="check_desc()" name="desc" rows="4" cols="50"></textarea></td>
					</tr>
					
					
						<tr>
					<td></td>
					<td><label class="label" id="suggdesclabel"></label></td>
					</tr>
					
					
					
					
					</table>
				</div>
				<input type="reset"  id="reset" value="Reset" onclick="reset_fields();"></input>	
				<input type="submit" id="complain" value="Submit"  onclick="return validate()"></input>			
			</form>
			<div id="right_column">
			
			<div id="citizenoptions">
	<h3><a href="#">Complaint</a></h3>
	<div>
		<p><a href="CitizenComplaint" style="font-size:14px;color:#65b8f9;">File your complaints here</a></p>
		<br/>
		<br/>
		<p><a href="citizenHome.jsp" style="font-size:14px;color:#65b8f9;">View the complaints pertaining to your area</a></p>
		<br/>
		<br/>
		<p><a href="mycomplaints.jsp" style="font-size:14px;color:#65b8f9;">My Complaints</a></p>
	</div>
<h3><a href="#">Groups</a></h3>
	<div>
		<p><span style="font-size:14px;color:#65b8f9;">View neighbourhood groups</span></p>
		<br/>
		<%@ page import="java.util.*"%>
		<%@ page import="entity.Group" %> 
		<% String group=session.getAttribute("groups1").toString();
		if(group.equals("no groups"))
		{%>
			<br/><span>No Groups</span>
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
		<p><span style="font-size:14px;color:#65b8f9;">Suggestions from your area:</span></p>
		<br/>
		<%@ page import="entity.Suggestion" %> 
		<% String suggestion=(String)session.getAttribute("suggestions1");
		if(suggestion.equals("no suggestions"))
		{%>
			<span>No Suggestions</span>
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
                <div class="heading">
                	<h2>Call Toll-Free</h2>
                </div> 
                	<ul>
            			<li><span>1800-0989-1400</span>&nbsp; South Chennai</li>
                        <li><span>1800-0989-1500</span>&nbsp; North Chennai</li>
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