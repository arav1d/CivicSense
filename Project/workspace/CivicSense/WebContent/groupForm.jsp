<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="css/reg_style.css" rel="stylesheet">
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet">
<script type="text/javascript" src="scripts/custom.js"></script>
<script type="text/javascript" src="scripts/search.js"></script>
<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.tagcloud.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<title>CivicSense|CreateGroup</title>
<style type="text/css">
sup{color:red;}
.label{color:red;}
.table{background-color:lightblue;}
#desc{resize:none;}
</style>

<script>
	$(function() {
		$( "input:submit").button();
		$( "input:reset").button();
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

function check_name()
{
var name=document.getElementById("name");
var namelabel=document.getElementById("namelabel");
var pattern=/^[ a-zA-Z0-9]+$/;
if(name.value=="")
 namelabel.innerHTML="cannot be empty";
else if(!name.value.match(pattern))
 namelabel.innerHTML="can contain only alphabets and numbers";
else
namelabel.innerHTML="";
}

function check_desc()
{
	var desc=document.getElementById("desc");
	var desclabel=document.getElementById("desclabel");
	var pattern=/^[ a-zA-Z0-9,.\n-]+$/;
	if(desc.value=="")
	 desclabel.innerHTML="cannot be empty";
	else if(!desc.value.match(pattern))
	 desclabel.innerHTML="cannot contain special characters other than ,.-";
	else if(desc.value.length>300)
		desclabel.innerHTML="cannot exceed more than 300 characters";
	else
	desclabel.innerHTML="";
}


function validate()
{
var labels=document.getElementsByClassName("label");

check_name();
check_desc();

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
document.getElementById("name").value="";
document.getElementById("desc").value="";
}
</script>



</head>
<body>
<div id="wrapper">
		<div id="header">
			<p><span>Contact:</span> <strong>Toll Free 1800-000-000</strong></p>
			<ul>
				<li class="no_bg"><a href="ngoHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
		</div>
		<a href="ngoHome.jsp" id="logo" title="civic sense"></a>
		<div id="navigation">
			<span>Creation of Public Group</span>
		</div>
		<div id="content">
		
			<form id="regform" action="GroupHandle" method="post"  >
				<h3 style="color:#91bff9;">Instructions: Please fill your group details below and click the 'Create Group' button at the bottom.</h3>
			    <h2><sup>*</sup> indicates mandatory fields</h2>
				<div class="text">
					<h2>Group Details</h2>
						<table class="table" width="100%">
						<tr>
						<td>Name of the Group:<sup>*</sup></td>
						<td><input type="text" name="name" id="name" size="50" onchange="check_name()" maxlength="50" /></td>
						</tr>
						<tr>
						<td></td>
					    <td><label class="label" id="namelabel"></label></td>
						</tr>
						<tr>
						<td>What is your group all about?:<sup>*</sup></td>
						<td><textarea id="desc" name="desc" rows="10" cols="40" onchange="check_desc()"></textarea></td>
						</tr>
						<tr>
						<td></td>
					    <td><label class="label" id="desclabel"></label></td>
						</tr>
						</table>
				</div>
			<input type="submit"  id="register" value="Create"  onclick="return validate()"/>
			<input type="reset"  id="reset" value="Reset" onclick="javascript:reset_fields()"/>
			</form>
			
			<div id="right_column">
			<div id="citizenoptions">
	<h3><a href="#">Initiate Groups</a></h3>
	<div>
		<p><a href="groupForm.jsp"  style="font-size:14px;color:#65b8f9;">Create Group</a></p>
		<br/>
		<br/>
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
			<span>No Groups</span>
		<% }
		else{
		@SuppressWarnings("unchecked")
		List<Group> grp =(List<Group>) session.getAttribute("groups")  ;
		if(grp!=null  && !grp.isEmpty())	{%>
	<%		for(int i = 0;i < grp.size(); ++i){		%>
	<br/><a href="NGOView?value=<%= grp.get(i).getGroupId() %> "style="text-decoration:none;" ><%= grp.get(i).getName() %></a>
	<%} }}%>
	</div>
</div>
				<div class="heading">
                	<h2>Popular Groups</h2>
                </div>
                	<ul>
            			<li><span>Cigarette-BAN</span>&nbsp;Towards a healthier society</li>
                        <li><span>Schools</span>&nbsp; Educational reforms</li>
                        <li><span>Garbage menace</span>&nbsp; General health</li>
                        <li><span>How to handle</span>&nbsp; The authority tutor</li>
            		</ul>
                
                <div class="heading">
                	<h2>Recent News</h2>
                    	<img src="images/news.png" alt="" />
                </div> 
                	<ul>
            			<li><span>Cleanliness day</span>&nbsp; Celebration and messages</li>
                        <li><span>Stamp paper scams</span>&nbsp; Beware of the false stamps</li>
            		</ul> 
			</div>
		
		
		</div>

</div>
<div id="footer">
		<div id="footer_content">
			<ul>
				<li class="no_bg"><a href="ngoHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
			<p> &copy; 2012 Civic Sense - Team. All wrongs unreserved. </p>
		</div>
	</div>
</body>
</html>