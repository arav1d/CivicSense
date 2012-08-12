
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

<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<title>CivicSense | Group</title>

<style type="text/css">
sup{color:red;}
.label{color:red;}
.table{background-color:lightblue;}
.table{resize:none;}
#desc{resize:none;}
#newpost{resize:none;}
</style>

<script>
	$(function() {
		$( "input:submit").button();
		$( "input:button").button();
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




//we should write ajax to send the appended data to the database
function append_newpost(citizen)
{
	var newpost=document.getElementById("newpost");
	var forum=document.getElementById("forum");
	if(newpost.value!="")
		{
		 if($('#forum').height() > 500)
		 {//alert(forum.childNodes[forum.childNodes.length-1].value);
			 forum.removeChild(forum.childNodes[forum.childNodes.length-1]);
			 forum.removeChild(forum.childNodes[forum.childNodes.length-1]);
		 }
		var row=document.createElement("tr");
		var row1 = document.createElement("tr");
		row.setAttribute("class","post");
	    var data=document.createElement("td");
	    var data1=document.createElement("td");
	    data.style.fontSize = "14px";
	    data.style.maxWidth = "300px";
	    data.style.overflow = "auto";
	    data.style.minHeight = "50px";
	    data.style.padding = "2px";
	    data.style.border = "solid 1px";
	    data.style.mozBorderRadius = "35px";
	    data.style.borderRadius = "35px";
	    data.style.borderColor = "#A8A8A8";
	    data.style.backgroundColor = "#04616E";
	    data.style.color = "#FFFFFF";
	    data.innerHTML=newpost.value;
	    var content = newpost.value;
	    data1.style.color = "ghostwhite";
	    data1.style.padding = "2px";
	    data1.innerHTML="Posted By "+citizen;
		data.setAttribute("colspan","2");
	    row.appendChild(data);
	    empty = document.createElement("td");
	    empty.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp"; 
	    row1.appendChild(empty);
	    row1.appendChild(data1);
		forum.insertBefore(row1, forum.childNodes[0]);
		forum.insertBefore(row, forum.childNodes[0]);
		newpost.value = "";
		xobj =new XMLHttpRequest();
		var idnum=document.getElementById("gid").innerHTML;
		xobj.open("GET","GroupContent?id="+idnum+"&content="+content,false);
		xobj.onreadystatechange = function(){
			if(xobj.readyState == 4 && xobj.status == 200)
			{
			}};
		xobj.send();
		}
	
			
}

function populate(contents)
{

	//var contents = [];
	//var names = [];
	var i,names;
	var con=contents.split("&");
	var forum=document.getElementById("forum");
	
	 if($('#forum').height() > 500)
	 {//alert(forum.childNodes[forum.childNodes.length-1].value);
		 forum.removeChild(forum.childNodes[forum.childNodes.length-1]);
		 forum.removeChild(forum.childNodes[forum.childNodes.length-1]);
	 }
	var row=document.createElement("tr");
	var row1 = document.createElement("tr");
	row.setAttribute("class","post");
    var data=document.createElement("td");
    var data1=document.createElement("td");
    data.style.fontSize = "14px";
    data.style.maxWidth = "300px";
    data.style.overflow = "auto";
    data.style.minHeight = "50px";
    data.style.padding = "2px";
    data.style.border = "solid 1px";
    data.style.mozBorderRadius = "35px";
    data.style.borderRadius = "35px";
    data.style.borderColor = "#A8A8A8";
    data.style.backgroundColor = "#04616E";
    data.style.color = "#FFFFFF";
    data.innerHTML=con[0];
    data1.style.color = "ghostwhite";
    data1.style.padding = "2px";
    data1.innerHTML="Posted by "+con[1];
	data.setAttribute("colspan","2");
    row.appendChild(data);
    empty = document.createElement("td");
    empty.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp"; 
    row1.appendChild(empty);
    row1.appendChild(data1);
	forum.insertBefore(row1, forum.childNodes[0]);
	forum.insertBefore(row, forum.childNodes[0]);
	
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
		
			<div id="sl" style="display:none;" onclick="this.style.display = 'none'"></div>
		<div id="navigation">
			<span>Public Group Forum</span>
		</div>
		<div id="content">
		
			<form id="regform" action="GroupContent" method="post"  >
				<h3 style="color:#91bff9;">Instructions: Type in your post and click 'Post' button to post any public content to the group</h3><br/>
				<h3 style="color:#91bff9;">Please make use of html tags to format your posts! [&nbsp;&nbsp;&lt;p&gt;,&lt;br&gt;,&lt;b&gt;,&lt;i&gt;&nbsp;&nbsp;] </h3>
				<hr/>
				<div class="text">
					<h2>Group Details</h2>
						<table class="table" width="100%">
						<tr>
						<td>Name of the Group:</td>
						<td><label  id="name">${group.name}</label></td>
						</tr>

						<tr>
						<td>Created By:</td>
						<td><label  id="name">${group.ngo.name}</label></td>
						</tr>
						<tr>
						<td>Group Description:</td>
						<td><label  id="desc">${group.desc}</label></td>

						</tr>
						<tr>
						<td>Group Id:</td>
						<td><label  id="gid">${group.groupId}</label></td>
						</tr>
						</table>
				</div>
				<div class="text">

					<h2>Forum</h2>
					<br /><br />
					<div style="margin:10px;">			
					<textarea id="newpost" name="newpost" rows="5" cols="50" style="margin:5px;"></textarea>
					
				  <input type="button" id="post" value="Post"  style="float:right;height:30px;width:50px;" onclick="append_newpost('${user.fname}')"/>
			       <input type="reset"  id="reset" value="Reset"/>
				</div>
						<table id="forum" width="100%" style="min-width:300px;margin-left:50px;overflow:auto;">
						<c:forEach var="content" items="${contents}">
							<script>populate('${content}');</script>
						</c:forEach>
						<tr class="post">
						<td style="max-width:200px;font-size:14px" colspan="2" >the group was created by</td>
						</tr>
						<tr><td></td>
						<td style="color:ghostwhite;">${group.ngo.name}</td>
						</tr>
						</table>
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
	</div>
	<h3><a href="#">Suggestion</a></h3>
	<div>
	<p><a href="suggestionForm.jsp" style="font-size:14px;color:#65b8f9;">Post your suggestions</a></p>
		<br/>
		<br/>
		<p><span style="font-size:14px;color:#65b8f9;">Suggestions from your area:</span></p>
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