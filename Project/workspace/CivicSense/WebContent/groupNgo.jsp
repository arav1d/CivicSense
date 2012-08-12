
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
<script type="text/javascript" src="scripts/jquery.toastmessage.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>

<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<title>CivicSense|Group</title>

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
	});
	
	$(function() {
		$( "#citizenoptions" ).accordion({
			collapsible: true
		});
		$( "#citizenoptions" ).accordion('activate',1);
	});
</script>

<script type="text/javascript">

var tval=0;


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
			<span>Public Group Forum</span>
		</div>
		<div id="content">
		
			<form id="regform" action="#" method="post"  >
				<h3 style="color:#91bff9;">Instructions: Type in your post and click 'Post' button to post any public content to the group</h3>

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
					<!-- 
					<div style="margin:10px;">			
					<textarea id="newpost" name="newpost" rows="5" cols="50" style="margin:5px;"></textarea>
					
				  <input type="button" id="post" value="Post"  style="float:right;height:30px;width:50px;" onclick="append_newpost('${ngo.name}')" />
			       <input type="reset"  id="reset" value="Reset"/>
				</div>
			-->
				<div style="margin:10px;">	
			
				You have access to view only !
				
				</div>
						<table id="forum" width="100%" style="min-width:300px;margin-left:50px;">
						<c:forEach var="content" items="${contents}">
							<script>populate('${content}');</script>
						</c:forEach>
						<tr class="post">
						<td style="max-width:200px;font-size:14px" colspan="2" >The group was created by</td>
						</tr>
						<tr><td></td>
						<td style="color:ghostwhite;">${group.ngo.name}</td>
						</tr>
						</table>
				</div>

							
				
			</form>
			
			<div id="right_column">
			<div id="citizenoptions">
	<h3><a href="#">Initiate Groups</a></h3>
	<div>
		<p><a href="groupForm.jsp" style="font-size:14px;color:#65b8f9;">Create Group</a></p>
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
			<br/><span>No Groups</span>
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