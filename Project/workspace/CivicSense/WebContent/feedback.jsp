
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>
<link type="text/css" href="css/mb.scrollable.css" rel="stylesheet"/>
<link type="text/css" href="css/authority.css" rel="stylesheet"/>
<link type="text/css" href="css/jquery.toastmessage.css" rel="stylesheet"/>
<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.tagcloud.js"></script>
<script type="text/javascript" src="scripts/jquery.toastmessage.js"></script>
<script type="text/javascript" src="scripts/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.all.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.position.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.resizable.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.selectable.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<script type="text/javascript" src="scripts/mbScrollable.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="scripts/search.js"></script>
<script language="javascript">
var count = -8;
var aid;

function shownext()
{
	var clist = document.getElementById("comptiles");
	var cont = document.getElementById("controls");
	if(count != 304)
	count = count + 8;
	else
		return;
	var number = count;

	xobj = new XMLHttpRequest();
	xobj.open("GET","AdminView?number="+number+"&type=feedback&nav=next",true);
	xobj.onreadystatechange = function(){
		if(xobj.readyState == 4 && xobj.status == 200)
		{	if(xobj.responseText=='0')
			{
			document.getElementById("right_column").style.paddingTop = "230px";
			clist.innerHTML="<div><p style='color:white;'>NO COMPLAINTS TO DISPLAY!</p></div>";
			cont.innerHTML = "<div style='visibility:hidden;'></div>";
			}
			else
			{
				document.getElementById("right_column").style.paddingTop = "340px";
				clist.innerHTML = xobj.responseText;
				cont.innerHTML = "<div class='first'>first</div><div class='prev'>prev</div><div class='next'>next</div><div class='last'>last</div><div class='pageIndex'></div><div class='start'>start</div><div class='stop'>stop</div>";
				$(function(){
				    $("#comptiles").mbScrollable({
				      width:800,
				      elementsInPage:2,
				      elementMargin:4,
				      shadow:"#999 2px 2px 2px",
				      height:"auto",
				      controls:"#controls",
				      slideTimer:600,
				      autoscroll:true,
				      scrollTimer:5000 
				    });
				  });	
			}
			
			
			}		
		
	};
	
	xobj.send();
	

	}
	function showprev()
	{
		var clist = document.getElementById("comptiles");
		var cont = document.getElementById("controls");
		if(count > 0)
		count = count - 8;
		else
			return;
		var number = count;
		xobj = new XMLHttpRequest();
		xobj.open("GET","AdminView?number="+number+"&type=feedback&nav=prev",true);
		xobj.onreadystatechange = function(){
			if(xobj.readyState == 4 && xobj.status == 200)
			{	
				if(xobj.responseText=='0'){
					document.getElementById("right_column").style.paddingTop = "230px";
					clist.innerHTML="<div><p style='color:white;'>NO COMPLAINTS TO DISPLAY!</p></div>";
					cont.innerHTML = "<div style='visibility:hidden;'></div>";
				}
				else
				{
					document.getElementById("right_column").style.paddingTop = "340px";
					clist.innerHTML = xobj.responseText;
					cont.innerHTML = "<div class='first'>first</div><div class='prev'>prev</div><div class='next'>next</div><div class='last'>last</div><div class='pageIndex'></div><div class='start'>start</div><div class='stop'>stop</div>";
					$(function(){
					    $("#comptiles").mbScrollable({
					      width:800,
					      elementsInPage:2,
					      elementMargin:4,
					      shadow:"#999 2px 2px 2px",
					      height:"auto",
					      controls:"#controls",
					      slideTimer:600,
					      autoscroll:true,
					      scrollTimer:5000 
					    });
					  });	
				}
				
				
				}		
		};
		xobj.send();
	}




function populate(val)
{
var oldcontainer=document.getElementById("cdesc");
var olddiv =  oldcontainer.childNodes[3];
$(olddiv).fadeOut('slow');
val.style.backgroundColor = "black";
aid = val.getAttribute("id");
loadcomp(aid,olddiv);
}
 
function loadcomp(number,olddiv)
{
	var s = "a";
	xobj = new XMLHttpRequest();
	xobj.open("GET","AdminView?number="+number+"&type=complaint",true);
	xobj.onreadystatechange = function(){
		if(xobj.readyState == 4 && xobj.status == 200)
		{
			s = xobj.responseText;
			prep(s,olddiv);
		}};
	xobj.send();
	prep(s,olddiv);
}

function prep(a,nowclass)
{
	document.getElementById("disppur").style.visibility = "visible";
	var s = a.split('&');
	document.getElementById("stdt").innerHTML = "<span style='font-variant:small-caps;'>Street/Date:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[0];//street/date 
	document.getElementById("za").innerHTML = "<span style:'font-variant:small-caps;'>Area:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[1];//zone -- area 
	document.getElementById("citi").innerHTML = "<span style:'font-variant:small-caps;'>Complaint Posted by:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[2];//citizen name [id]
	document.getElementById("subdes").innerHTML = "<span style:'font-variant:small-caps;'>Complaint - Type:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[3];// dept -> subtype 
	document.getElementById("acd").innerHTML = "<p style='float:left;font-variant:small-caps;font-size:15px;'>Complaint Description:</p><br/><p style='text-align:center;font-size:15px;'>"+s[5]+"</p>";//complaint desc  
	document.getElementById("feedback").innerHTML = "<p style='color:#65b8f9;font-size:16px'><br/>Feedback :</p><br/><br/><p style='font-size:14px;color:#65b250'><br/>"+s[11]+"</p>";
	document.getElementById("l1").innerHTML = s[6];
	document.getElementById("l2").innerHTML = s[7];
	document.getElementById("l3").innerHTML = s[8];
	if(s[4] == "1")
	{
		document.getElementById("l1").style.backgroundColor = "#99b638";// s[5] gives the level of complaint process
		document.getElementById("l2").style.backgroundColor = "#230730";
		document.getElementById("l3").style.backgroundColor = "#230730";
	}
	else if(s[4] == "2")
	{
		document.getElementById("l1").style.backgroundColor = "#230730";
		document.getElementById("l2").style.backgroundColor = "#99b638";
		document.getElementById("l3").style.backgroundColor = "#230730";
	}
	else if(s[4] == "3")
	{
		document.getElementById("l1").style.backgroundColor = "#230730";
		document.getElementById("l2").style.backgroundColor = "#230730";
		document.getElementById("l3").style.backgroundColor = "#99b638";
	}
	else if(s[4] == "0")
	{
		document.getElementById("l1").style.backgroundColor = "#230730";
		document.getElementById("l2").style.backgroundColor = "#230730";
		document.getElementById("l3").style.backgroundColor = "#230730";
	}
	document.getElementById("cid").value = s[10];
	
	$(nowclass).fadeIn('slow');
}

$(document).ready(function(){$("#cdesc").toastmessage('showToast', {
    text     : 'Click any scroll<br/>below to view negative<br/>feedback complaints.',
    sticky   : false,
    stayTime : 7000,
    position : 'top-right',
    type     : 'notice'
});
});
	
$(function() {
	$( "#citizenoptions" ).accordion({
		collapsible: true
	});
	$( "#citizenoptions" ).accordion('activate',1);
});
	
	
$(function() {
	$( ".inside .compdet .toggle" ).buttonset();
});
$(function() {
	$( ".alternative button" ).button();});
	
$(function() {
	$( ".navig button").button();});
	
$(function() {
	$( "#memo" ).button();});

$.fn.tagcloud.defaults = {
		  size: {start: 10, end: 20, unit: 'px'},
		  color: {start: '#6699ff', end: '#ffffff'}
		};

$(function () {
	$('#whatever a').tagcloud();
});


</script>
<title>CivicSense|Feedback</title>
</head>
<body onload="shownext();">
<%--<body onload="prep('a',document.getElementById('cdesc').childNodes[3])">--%>
	<div id="wrapper">
		<div id="header">
			<p><strong style="color:white;">Welcome</strong>&nbsp;&nbsp;<span style="color:#75A3FF;">${user.fname}&nbsp;&nbsp;${user.zone}</span></p>
			<ul>
				<li class="no_bg"><a href="adminHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
		</div>
		<a href="adminHome.jsp" id="logo" title="civic sense"></a>
		<div id="content">
			<div id="left_column">
				<div class="scroll">
					<h2>Complaint Scroll (Negative Feedback)</h2><br/><br/><br/>
					<div id="comptiles">
    					<div class="scrollEl" onclick="populate(this)" style="background-color:#e73a35;">1<div class="date" style="color:#fff">Date:&nbsp;<a style="color:#fff;">12 Mar 2013</a></div><div class="place" style="color:#fff">Place:&nbsp;<a style="color:#fff;font-size:14px">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</a></div><div class="complainee" style="color:#fff">Complainee:&nbsp;<a style="color:#fff;">name of the complainee</a></div><div class="level" style="color:#fff">Complaint is at &nbsp;<a style="color:#fff;">level n</a></div><div class="desc1" style="color:#fff">Short Desc:&nbsp;<a style="color:#fff;">This is a complaint that extends</a></div><div class="desc2" style="color:#fff"><a style="color:#fff;">The second line of complaint</a></div></div>
    					<div class="scrollEl" onclick="populate(this)" style="background-color:#006699;">2<div class="date" style="color:#fff">Date:&nbsp;<a style="color:#fff;">12 Mar 2013</a></div><div class="place" style="color:#fff">Place:&nbsp;<a style="color:#fff;font-size:14px">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</a></div><div class="complainee" style="color:#fff">Complainee:&nbsp;<a style="color:#fff;">name of the complainee</a></div><div class="level" style="color:#fff">Complaint is at &nbsp;<a style="color:#fff;">level n</a></div><div class="desc1" style="color:#fff">Short Desc:&nbsp;<a style="color:#fff;">This is a complaint that extends</a></div><div class="desc2" style="color:#fff"><a style="color:#fff;">The second line of complaint</a></div></div>
    					<div class="scrollEl" onclick="populate(this)" style="background-color:#99cc33;">3<div class="date" style="color:#fff">Date:&nbsp;<a style="color:#fff;">12 Mar 2013</a></div><div class="place" style="color:#fff">Place:&nbsp;<a style="color:#fff;font-size:14px">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</a></div><div class="complainee" style="color:#fff">Complainee:&nbsp;<a style="color:#fff;">name of the complainee</a></div><div class="level" style="color:#fff">Complaint is at &nbsp;<a style="color:#fff;">level n</a></div><div class="desc1" style="color:#fff">Short Desc:&nbsp;<a style="color:#fff;">This is a complaint that extends</a></div><div class="desc2" style="color:#fff"><a style="color:#fff;">The second line of complaint</a></div></div>
    					<div class="scrollEl" onclick="populate(this)">4</div>
    					<div class="scrollEl" onclick="populate(this)">5</div>
    					<div class="scrollEl" onclick="populate(this)">6</div>
    					<div class="scrollEl" onclick="populate(this)">7</div>
    					<div class="scrollEl" onclick="populate(this)">8</div>
  					</div>
  
  <div id="controls">
    <div class="first">first</div><div class="prev">prev</div>
    <div class="next">next</div><div class="last">last</div>
    <div class="pageIndex"></div>
    <div class="start">start</div><div class="stop">stop</div>
  </div>
</div>
	<div class="navig">
<button id="nextset" style="float:right;margin-left:10px;" onclick="shownext()">next set</button>
<button id="prevset" style="float:right;" onclick="showprev()">prev set</button>
</div> 
				<div class=" text alternative" id="cdesc">
					<h2>Issue Memo</h2>
						<div class="inside" id="disppur" style="visibility:hidden;overflow:auto;">
						
						<div style="margin-left:3px;margin-top:3px;font-size:15px">
						<p id="stdt" style="font-size:15px;"></p><br/><p id="za" style="font-size:15px;"></p>
						<p id="citi" style="font-size:15px;" ></p>
						<br/>
						<p id="subdes" style="font-size:15px;"></p>
						<br/>
						<br/>
						</div>
						<br/>
						<br/>
						<div id="acd" style="overflow:auto;font-size:15px;margin-bottom:10px;"></div>
						<div class="compdet" id="cds" style="float:left;max-width:520px;margin-top:10px;"> 						
  							
						<div id="cpp" style="background-color:#230730;font-weight:bold;overflow:auto;max-height:300px;min-height:150;max-width:500px;min-width:400px;float:left;margin-left:10px;margin-top:10px;">
  								<p style="background-color:#000;color:#fff;font-size:18px;">The current processs level of complaint:</p>
  								<p id="l1" style="color:#8C4618;font-size:16px;">l1</p>
  								<p >&nbsp;</p>
  								<p id="l2" style="color:#8C4618;font-size:16px;">l2</p>
  								<p>&nbsp;</p>
  								<p id="l3" style="color:#8C4618;font-size:16px;">l3</p>
  								
  						</div>
  						<div id="feedback" style="margin:10px;float:left;overflow:auto;"></div>
  						<form action="MemoForm" method="GET">
 						<button type="submit" id="memo" style="float:left;margin-left:10px;margin-top:16px;" >Issue Memo</button>
 						<input type="hidden" id="cid" name="id" value=""/>
 						</form>
							</div>
						</div>
				</div>
				
			</div>
					
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


                <%--
                <div id="selection">
				<ul>
					<li class="active"><a href ="#">Citizen</a></li>
					<li><a href="#">Authority</a></li>
					<li><a href="#">Admin</a></li>
					<li><a href="#">NGO</a></li>
				</ul>
				</div>
                --%>
            		
                <div class="heading">
                	<h2>Administrator and Civic Sense</h2>
                </div>
                    	<div id="whatever">
  							<a href="#" rel="7">Filter complaints</a>
  							<a href="#" rel="3">Create Authority access</a>
  							<a href="#" rel="10">Complaint Scroll</a>
  							<a href="#" rel="5">View Negative feedbacks</a>
  							<a href="#" rel="6">Issue Memos</a>
  							<a href="#" rel="2">Give credits</a>
						</div>	
                <div class="heading">
                	<h2>Administrator can</h2>
                </div>
                	<ul>
            			<li><span>Handle complaints</span>&nbsp;Using complaint scroll</li>
                        <li><span>Filter invalid complaints</span>&nbsp;to keep the system clean</li>
                        <li><span>View negative feedbacks</span>&nbsp;from the citizen</li>
                        <li><span>Issue memos</span>&nbsp;to irregular authorities</li> 
            		</ul>
            	
			</div>
		
		
		</div>
	</div>
	
	<div id="footer">
		<div id="footer_content">
			<ul>
				<li class="no_bg"><a href="adminHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
			<p> &copy; 2012 Civic Sense - Team. All wrongs unreserved. </p>
		</div>
	</div>
</body>
</html>