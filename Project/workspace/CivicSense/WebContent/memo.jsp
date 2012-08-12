<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<script type="text/javascript" src="scripts/jspdf/jspdf.js"></script>
<script type="text/javascript" src="scripts/jspdf/libs/base64.js"></script>
<script type="text/javascript" src="scripts/jspdf/libs/sprintf.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<title>CivicSense|Memo</title>

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
		$( "#citizenoptions" ).accordion('activate',1);
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

function export_pdf()
{
var doc = new jsPDF();
var mid=document.getElementById("id").innerHTML;
var creator=document.getElementById("creator").innerHTML;
var date=document.getElementById("date").innerHTML;
var dept=document.getElementById("dept").innerHTML;
var credits=document.getElementById("credits").innerHTML;
var desc=document.getElementById("desc").innerHTML;
var zone=document.getElementById("zone").innerHTML;
var ward=document.getElementById("ward").innerHTML;
var authority=document.getElementById("auth").innerHTML;

doc.text(60,10,'Memo Details');
doc.text(20,22,'Memo Id:'+mid);
doc.text(20,32,'Issued By:'+creator);
doc.text(20,42,'Issued On:'+date);
doc.text(20,52,'Responsible Authority:'+authority);
doc.text(20,62,'Zone:'+zone);
doc.text(20,72,'Ward:'+ward);
doc.text(20,82,' Department:'+dept);
doc.text(20,92,'Memo Description:'+desc);
doc.text(20,102,'Current Authority Credits:'+credits);
		
doc.output('datauri');
}



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
			<span>Memo Description</span>
		</div>
		<div id="content">
		<div id="regform">
				<div class="text" >
					<h2>Memo Details</h2>
					</div>
						<table width="100%" class="table" style="overflow:auto;font-size:15px;">
						<tr>
						<td>Memo Id:</td>
						<td><label  id="id">${memo.memoId}</label></td>
						</tr>
						<tr>
						<td>Issued By(Administrator):</td>
						<td><label  id="creator">${memo.administrator.fname} ${memo.administrator.lname}</label></td>
						</tr>
						<tr>
						<td>Responsible Authority:</td>
						<td><label  id="auth">${memo.authority.fname} ${memo.authority.lname}</label></td>
						</tr>
						<tr>
						<td>Issued On:</td>
						<td><label  id="date">${memo.date}</label></td>
						</tr>
						<tr>
						<td>Department:</td>
						<td><label  id="dept">${memo.authority.dept}</label></td>
						</tr>
						<tr>
						<td>Authority Credits:</td>
						<td><label  id="credits">${memo.authority.credits}</label></td>
						</tr>
						<tr>
						<td>Description:</td>
						<td><label  id="desc">${memo.desc}</label></td>
						</tr>
						</table>
						<div class="text">
						<h2>Authority Location Details</h2>
						</div>
                         <table width="100%" class="table" style="overflow:auto;font-size:15px;">
						<tr>
						<td>Zone:</td>
						<td><label  id="zone">${memo.authority.zone}</label></td>
						</tr>
						
						<tr>
						<td>Ward:</td>
						<td><label  id="ward">${memo.authority.ward}</label></td>
						</tr>
						</table>
						<input type="button" id="pdf" value="Export as pdf" onclick="export_pdf()" style="float:right"/>
					</div>
					
				
				
				<div id="right_column">
			<div id="citizenoptions">
	<h3><a href="#">Complaint</a></h3>
	<div>
				<p><a href="authorityHome.jsp" style="font-size:14px;color:#65b8f9;">View the complaints to handle</a></p>
				<br/>
				<br/>
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
		<br/><a href="Memo?value=<%= gp1.get(j).getMemoId() %> "style="text-decoration:none;" ><%= gp1.get(j).getDesc().substring(0, 20) %> ...</a>
		<%}}}%>
	</div>
	<h3><a href="#">Suggestion</a></h3>
	<div>
		<p><span style="font-size:14px;color:#65b8f9;">Suggestions to you Zone:</span></p>
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
				<li class="no_bg"><a href="authorityHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>

			</ul>
			<p> &copy; 2012 Civic Sense - Team. All wrongs unreserved. </p>
		</div>
	</div>
</body>
</html>