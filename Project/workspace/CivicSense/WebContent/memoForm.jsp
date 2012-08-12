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
<title>CivicSense|IssueMemo</title>
<% request.setAttribute("complaint",request.getAttribute("complaint")); %>
<style type="text/css">
sup,.label{color:red}
h3{text-align:center}
.table{background-color:lightblue}
</style>


<script type="text/javascript">

$(function() {
	$( "input:submit").button();
	$("input:reset").button();
});

$(function() {
	$( "#citizenoptions" ).accordion({
		collapsible: true
	});
	$( "#citizenoptions" ).accordion('activate',2);
});

function check_desc()
{
var desc=document.getElementById("desc");
var desclabel=document.getElementById("desclabel");
var pattern=/^[a-zA-Z0-9\n .,-/]+$/;


if(desc.value=="")
	desclabel.innerHTML="cannot be empty";
else if(!desc.value.match(pattern))
	desclabel.innerHTML="cannot contain special characters other than ,.-/";
else if(desc.value.length>300)
	desclabel.innerHTML="cannot exceed more than 300 characters";
else if(desc.value.length<20)
	desclabel.innerHTML="should be atleast 20 characters in length";
else
	desclabel.innerHTML="";
}



function validate()
{
	var labels=document.getElementsByClassName("label");
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
document.getElementById("desc").value="";
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
			<span>Issue Memo</span>
		</div>
		<div id="content">
		<form id="regform" action="Memo" method="post">
				<h3 style="color:#91bff9;">Instructions: Please fill the memo details below and click the 'Issue' button at the bottom.
				<br />(<sup>*</sup>indicates required fields)</h3><br/>
				<h3 style="color:#91bff9;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please make use of html tags to format your memos! [&nbsp;&nbsp;&lt;p&gt;,&lt;br&gt;,&lt;b&gt;,&lt;i&gt;&nbsp;&nbsp;] </h3>
				<hr />	
				<div class="text">
					<h2>From whom? To whom?</h2>
					<table width="100%" class="table" style="overflow:auto;">
					<tr>
					<td>Administrator ID:</td>
					<td><input readonly=readonly id="adminid" name="adminid" type="text" size="20" value="${user.adminId }"/></td>
					<td>Authority ID:</td>
					<td><input type="text" size="20" readonly=readonly id="authid" name="authid" value="${complaint.authority.authorityId }"/></td>
					</tr>



					<tr>
					<td>Zone:</td>
					<td><input type="text" size="20" readonly=readonly id="zone" name="zone" value="${complaint.location.zone }"/></td>
					<td>Ward:</td>
					<td><input type="text" size="20" readonly=readonly id="ward" name="ward" value="${complaint.location.ward }"/></td>
					</tr>


					<tr>
					<td>Department the authority belongs to:</td>
					<td><input type="text" size="20" readonly=readonly id="dept" name="dept" value="${ complaint.dept}"/></td>
					</tr>
					<tr>
					<td>Memo issued for the below complaint ID:</td>
					<td><input type="text" size="20" readonly=readonly id="compdesc" name="compId" value="${complaint.complaintId}"/></td>
					</tr>
					<tr>
					<td>Memo issued for the below complaint:</td>
					<td><input type="text" size="20" readonly=readonly id="compdesc" name="compdesc" value="${complaint.complaintDesc }"/></td>
					</tr>
					</table>
					</div>
					<div class=" text alternative">
					<h2>Write to the authority</h2>
					<table class="table" width="100%">
					<tr>
					<td>Memo Description:<sup>*</sup></td>
					<td><textarea id="desc" name="desc" rows="10" onchange="check_desc()" cols="50"></textarea></td> 
					</tr>

					<tr>
					<td></td>
					<td><label id="desclabel" class="label"></label></td>
					</tr>
					<tr>
					<td></td>
					<td><input  id="idlabel" class="label" type="hidden" name="value" value="${complaint.complaintId }" /></td>
					</tr>

					</table>
					</div>
					<input type="reset"  id="reset" value="Reset" onclick="reset_fields();"></input>	
					<input type="submit" id="postmemo" onclick="return validate()" value="Post Memo" ></input>
					</form>
<div id="right_column">
			<div id="citizenoptions">
	<h3><a href="#">Authority Account</a></h3>
	<div>
		<p><a href="account.jsp"  style="font-size:14px;color:#65b8f9;">Create Authority Account</a></p>
		<br/>
		<br/>
	</div>
	<h3><a href="#">Complaint</a></h3>
	<div>
		<p><a href="adminHome.jsp"  style="font-size:14px;color:#65b8f9;">Find complaints to filter</a></p>
		<br/>
		<br/>
	</div>
	<h3><a href="#">Feedbacks</a></h3>
	<div>
		<p><a href="Feedback" style="font-size:14px;color:#65b8f9;">View Negative Feedbacks</a></p>
		<br/>
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
				<li class="no_bg"><a href="authorityHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>

			</ul>
			<p> &copy; 2012 Civic Sense - Team. All wrongs unreserved. </p>
		</div>
	</div>
</body>
</html>