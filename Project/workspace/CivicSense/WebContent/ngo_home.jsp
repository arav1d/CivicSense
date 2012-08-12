<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link type="text/css" href="css/reg_style_new.css" rel="stylesheet">
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet">
<script type="text/javascript" src="scripts/custom.js"></script>
<script type="text/javascript" src="scripts/search.js"></script>
<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.position.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.resizable.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>

<title>Ngo|Home</title>

<style type="text/css">
sup{color:red;}
.label{color:red;}
.table{background-color:lightblue;}
.table{resize:none;}
#desc{resize:none;}
#newpost{resize:none;}
</style>

<script>
var val;
	$(function() {
		$( "input:submit").button();
		$( "input:button").button();
		$( "input:reset").button();
	});
	
	$(function() {
		$('button').button();});

	
	$(function() {
		$( "#citizenoptions" ).accordion({
			collapsible: true
		});
		$( "#citizenoptions" ).accordion('activate',1);
	});
	
	function show()
	{
		
		$(function() {
		
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
	
		$( "#dialog-message" ).dialog({
			modal: true,
			buttons: {
				Update: function() {
					var st = document.getElementById("stattt").value;
					document.getElementById("des").innerHTML = st;
					$( this ).dialog( "close" );
					
				}
			}
		});
	});
	
	}
</script>

<script type="text/javascript">




//we should write ajax to send the appended data to the database
/*
function populate()
{
		var links=document.getElementById("links");
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
	    data.style.mozBoxShadow = "5px 5px 7px #888";
	    data.style.mozBorderRadiusBottomright = "15px";
	    data.style.webkitBoxShadow = "5px 5px 7px #888";
	    data.webkitBorderBottomRightRadius = "15px";
	    data.style.boxShadow = "5px 5px 7px #888";
	    data.style.color = "#FFFFFF";
	    data1.style.color = "ghostwhite";
	    data1.style.padding = "2px";
	    data1.innerHTML=desc;
		data.setAttribute("colspan","2");
		data.innerHTML = val;
	    row.appendChild(data);
	    empty = document.createElement("td");
	    empty.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;";
	    row1.appendChild(empty);
	    row1.appendChild(data1);
		links.insertBefore(row1, links.childNodes[0]);
		links.insertBefore(row, links.childNodes[0]);
}
*/

</script>



</head>
<body>
<div id="dialog-message" title="Welcome" style="display:none;">
	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		Your status updated !
	</p>
	<textarea id="stattt" ></textarea>
	</div>

<div id="wrapper">
		<div id="header">
			<p><span>Welcome</span> <strong>${sessionScope.name}</strong></p>
			<ul>
				<li class="no_bg"><a href="index.jsp">home</a></li>
				<%--  <span style="color:#525961">|</span> --%>
				<li><a href="faq.jsp">FAQ</a></li>
				<%-- <span style="color:#525961">|</span> --%>	
				<%-- <span style="color:#525961">|</span> --%>
				</ul>
		</div>
		<a href="index.jsp" id="logo" title="civic sense"></a>
		
		<form id="search_form" action="#" method="post">
			<p><input type="text"  value="Search the site for..." onfocus="this.value=''" onblur="this.value='Search the site for...'"/>
				<input type="submit" id="submit" value="" /></p>
		</form>
		<div id="sl" style="display:none;" onclick="this.style.display = 'none'"></div>
		<div id="navigation">
			<span>Public Group Forum</span>
		</div>
		<div id="content">
		
			<form id="regform">
				<h3 style="color:#91bff9;">You are now into a world of possibilities !</h3>
				<div class="text">
					<h2>${sessionScope.name}</h2>
						<table class="table" width="80%" style="margin:10px;font-size:14px;background-color:#5bb6b9;border:solid 2px">
						<tr>
						<td>The org strives to achieve</td>
						<td><label  id="name">${sessionScope.motto}</label></td>
						</tr>
						<tr>
						<td>Let's know about it's founder</td>
						<td><label  id="creator">${sessionScope.creator}</label></td>
						</tr>
						<tr>
						<td>This is how we work</td>
						<td><label  id="desc">${sessionScope.desc}</label></td>
						</tr>
						
						</table>
						
				</div>
				
				<div class="text" >
					<h2>Forum</h2>
					<br /><br />
					<div  style="width:100%;margin:10px;font-size:14px;font-color:#1EE8A5;background-color:#5bb6b9;border:solid 2px;">
					<p>Help your area ${sessionScope.area} joining hands with us</p><br/>
					<p style="float:right;">Contact us @ ${sessionScope.email} | ${sessionScope.phone}</p><br/>
					<p id="newpost" style="margin:5px;">There are <strong>${sessionScope.number}</strong> potential
					supporters for this forum :)</p><br/><br/>
					<p style="text-align:center;"><b>Keep us active !</b></p>
					 <p style="text-align:center;"><strong>You can discuss over our motto and 
						status on our forum for better city administration policies.</strong></p>
				</div>
					<table id="links" width="80%" style="margin:10px;font-size:14px;background-color:#5bb6b9;border:solid 2px">
						<tr class="post">
						<td style="min-width:450px;font-size:18px;text-align:center;" colspan="4" ><b>The group name</b></td>
						</tr>
						<tr>
						<tr>
						<td id="des" style="min-width:200px;font-size:14px;color:ghostwhite;" colspan="4">Group Desc</td>
						</tr>
						<tr>
						<td colspan="4"><button style="float:right;" onclick="show();">New status</button>
						</td>
						</table>
				</div>	
			</form>
			
			<div id="right_column">
			<div id="citizenoptions">
	<h3><a href="#">Home</a></h3>
	<div>
		<p><a href="#" style="color:#65b8f9;">Visit us!</a></p>
		<br/>
		<br/>
		<p><a style="color:#65b8f9;">Support us!</a></p>
	</div>

	<h3><a href="#">Groups</a></h3>
	<div>
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
				<li class="no_bg"><a href="index.jsp">Home</a></li>
				<li><a href="faq.jsp">FAQ</a></li>
				</ul>
			<p> &copy; 2012 Civic Sense - Team. All wrongs unreserved. </p>
		</div>
	</div>
	</body>
</html>