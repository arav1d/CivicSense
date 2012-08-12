<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="css/reg_style_new.css" rel="stylesheet">
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet">
<link type="text/css" href="css/jquery.toastmessage.css" rel="stylesheet"/>
<script type="text/javascript" src="scripts/search.js"></script>
<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.tagcloud.js"></script>
<script type="text/javascript" src="scripts/jquery.toastmessage.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<script type="text/javascript" src="scripts/jspdf/jspdf.js"></script>
<script type="text/javascript" src="scripts/jspdf/libs/base64.js"></script>
<script type="text/javascript" src="scripts/jspdf/libs/sprintf.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<title>CivicSense | Complaint</title>

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
		$( "#citizenoptions" ).accordion('activate',0);
	});
</script>




<script type="text/javascript">


function export_pdf()
{
var doc = new jsPDF();
var cid=document.getElementById("id").innerHTML;
var creator=document.getElementById("creator").innerHTML;
var date=document.getElementById("date").innerHTML;
var dept=document.getElementById("dept").innerHTML;
var type=document.getElementById("type").innerHTML;
var desc=document.getElementById("desc").innerHTML;
var zone=document.getElementById("zone").innerHTML;
var ward=document.getElementById("ward").innerHTML;
var authority=document.getElementById("authority").innerHTML;
var phone=document.getElementById("phone").innerHTML;
var email=document.getElementById("email").innerHTML;

doc.text(60,10,'Complaint Details');
doc.text(20,22,'Complaint Id:'+cid);
doc.text(20,32,'Posted By:'+creator);
doc.text(20,42,'Posted On:'+date);
doc.text(20,52,'Complaint Department:'+dept);
doc.text(20,62,'Complaint Type:'+type);
doc.text(20,72,'Complaint Description:'+desc);
doc.text(60,82,'Complaint Location Details');
doc.text(20,92,'Zone:'+zone);
doc.text(20,102,'Ward:'+ward);
doc.text(60,112,'Complaint Authority Details');
doc.text(20,122,'Responsible Authority:'+authority);
doc.text(20,132,'Authority Phone:'+phone);
doc.text(20,142,'Authority Email:'+email);
doc.output('datauri');
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
<%if(request.getAttribute("emailmsg") != null) { %>
<script>
$(document).ready(function(){ $().toastmessage('showToast', {
    text     : "Complaint copy has been <br/> mailed.",
    sticky   : false,
    stayTime : 10000,
    position : top-right,
    type     : 'success'
});});

</script>
<%  request.setAttribute("emailmsg", null);}%>
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
			<span>Your Complaint has been posted succesfully!</span>
		</div>
		<div id="content">
		<form id="regform">
				<div class="text">
					<h2>Complaint Details</h2>
						<table class="table" width="100%">
						<tr>
						<td>Complaint Id:</td>
						<td><label  id="id">${complaint.complaintId}</label></td>
						</tr>

						<tr>
						<td>Posted By:</td>
						<td><label  id="creator">${complaint.citizen.fname} ${complaint.citizen.lname}</label></td>
						</tr>
						
						<tr>
						<td>Posted On:</td>
						<td><label  id="date">${complaint.date}</label></td>
						</tr>
						
						<tr>
						<td>Complaint Department:</td>
						<td><label  id="dept">${complaint.dept}</label></td>
						</tr>
						
						
						<tr>
						<td>Complaint Type:</td>
						<td><label  id="type">${complaint.complaintDesc}</label></td>
						</tr>
						
						
						<tr>
						<td>Complaint Description:</td>
						<td><label  id="desc">${complaint.desc}</label></td>
						</tr>
						</table>
						</div>
						
						
						<div class="text" >
						<h2>Complaint  Location Details</h2>
                         <table class="table" width="100%">
						<tr>
						<td>Zone:</td>
						<td><label  id="zone">${complaint.location.zone}</label></td>
						</tr>
						
						<tr>
						<td>Ward:</td>
						<td><label  id="ward">${complaint.location.ward}</label></td>
						</tr>
						</table>
				</div>
				
				
							<div class="text" >
						<h2>Complaint  Authority Details</h2>
                         <table class="table" width="100%">
                         <tr>
						<td>Responsible Authority:</td>
						<td><label  id="authority">${complaint.authority.fname} ${complaint.authority.lname}</label></td>
						</tr>
						<tr>
						<td>Authority's Phonenumber:</td>
						<td><label  id="phone">${complaint.authority.phNo}</label></td>
						</tr>
						
						<tr>
						<td>Authority's email:</td>
						<td><label  id="email">${complaint.authority.email}</label></td>
						</tr>
						</table>
				</div>
				
				
				<div>
				<input type="button" id="pdf" value="Export as pdf" onclick="export_pdf()"/>
				</div>
				
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
		<br/>
		<br/>
		<p><a href="#" style="color:#65b8f9;">View neighbourhood groups</a></p>
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
	</div>
	<h3><a href="#">Suggestion</a></h3>
	<div>
		<p><a href="SuggestionHandle" style="font-size:14px;color:#65b8f9;">Post your suggestions</a></p>
		<br/>
		<br/>
		<p><a href="#" style="font-size:14px;color:#65b8f9;">Suggestions from your area:</a></p>
		<br/>
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
		<br/><p><a href="SuggestionHandle1?value=<%= gp2.get(j).getSuggestionId() %>" style="text-decoration:none;" ><%= gp2.get(j).getDesc().substring(0, 10)%></a></p>
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