<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%session.invalidate(); %>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="no-cache">
<title>Civic Sense</title>

<link type="text/css" href="css/style.css" rel="stylesheet"/>
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet"/>
<link type="text/css" href="css/jquery.toastmessage.css" rel="stylesheet"/>



<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.tools.min.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.all.js"></script>
<script type="text/javascript" src="scripts/slide.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<script type="text/javascript" src="scripts/jquery.toastmessage.js"></script>
<script type="text/javascript" src="scripts/search.js"></script>
<style type="text/css">

#errorlabel{color:red;}

</style>

<script>
tval = 0;

$(function() {
	$( "input:submit").button();
});

$(function() {
	 
    // if the function argument is given to overlay,
    // it is assumed to be the onBeforeLoad event listener
    $("a[rel]").overlay({
 
        mask: 'steelblue',
        effect: 'apple',
 
        onBeforeLoad: function() {
        	$("#overlay").show();
            // grab wrapper element inside content 
            var wrap = this.getOverlay().find(".contentWrap");
 
            // load the page specified in the trigger
            wrap.load(this.getTrigger().attr("href"));
        }
 
    });
});
 </script>
 
 <script>
 var login_count=0; //no of login attempts 
 
function goto_jsp()
{
var myform=document.getElementById("signup");
var errorlabel=document.getElementById("errorlabel");
check_radio();
if(errorlabel.innerHTML!="")
return false;
else
{
if(document.getElementById("citizen").checked)
myform.setAttribute("action","citizenSignup.jsp");
else
	myform.setAttribute("action","ngoSignup.jsp");
return true;
}
}


//Created Generates the captcha function    
function DrawCaptcha()
{
var a=Math.floor(Math.random() * 10);
var b=Math.floor(Math.random() * 10);       
var c=Math.floor(Math.random() * 10);  
var d=Math.floor(Math.random() * 10);  
var e=Math.floor(Math.random() * 10);  
var f=Math.floor(Math.random() * 10);  
var g=Math.floor(Math.random() * 10);  
var code=a+" "+b+" "+c+" "+d+" "+e+" "+f+" "+g+" ";
document.getElementById("captcha").value=code;
}

  

//Remove the spaces from the captcha code and returns it
function removeSpaces(string)
{
return string.split(' ').join('');
}
  
  
function check_captcha()
{
if(document.getElementById("input").value=="")
document.getElementById("errorlabel").innerHTML="please enter verification code";
else if(document.getElementById("input").value!=removeSpaces(document.getElementById("captcha").value))
document.getElementById("errorlabel").innerHTML="wrong verification code";
else
document.getElementById("errorlabel").innerHTML="";
}
  
  
function toggle_signup()
{
if(document.getElementById("authority").checked || document.getElementById("admin").checked)
{
document.getElementById("su").value="SignUp disabled";
document.getElementById("su").disabled=true;
}
else
{
document.getElementById("su").value="Sign up now !";
document.getElementById("su").disabled=false;
}
}


function check_uname()
{
if(document.getElementById("uname").value=="" ||document.getElementById("pwd").value=="" )
document.getElementById("errorlabel").innerHTML="username or password cannot be empty";
else
document.getElementById("errorlabel").innerHTML="";
}


function check_pwd()
{
if(document.getElementById("pwd").value=="" || document.getElementById("uname").value=="")
document.getElementById("errorlabel").innerHTML="username or password cannot be empty";
else
document.getElementById("errorlabel").innerHTML="";
}


function check_radio()
{
var radio1=document.getElementById("citizen");
var radio2=document.getElementById("authority");
var radio3=document.getElementById("admin");
var radio4=document.getElementById("ngo");

if(radio1.checked==0 && radio2.checked==0 && radio3.checked==0 && radio4.checked==0)
document.getElementById("errorlabel").innerHTML="select any of the option";
else
document.getElementById("errorlabel").innerHTML="";
}



function validate(count)
{
check_uname();
check_pwd();
var errorlabel=document.getElementById("errorlabel");

if(errorlabel.innerHTML!="")
return false;
else
{
check_radio();
if(errorlabel.innerHTML!="")
	return false;
else if(count!=null && count>=3)
{
check_captcha();
if(errorlabel.innerHTML!="")
	return false;
}
else
	return true;
}
}

/*
	if(msg != "")
	{
		tval = 0;
		$(document).toastmessage('showToast', {
		       text     : msg,
		       sticky   : false,
		       position : 'top-left',
		       type     : 'success'
		    });
	}
*/
$(document).ready(function(){$().toastmessage('showToast', {
    text     : 'Visit our intro tabs on top<br/>of the page!<br/>',
    sticky   : false,
    stayTime : 3000,
    position : 'top-right',
    type     : 'notice'
 });
});

$(document).ready(function(){ if(tval == 1){tval = 0;$().toastmessage('showToast', {
    text     : "Account creation<br/> <strong>successful<strong>! Login now!",
    sticky   : false,
    stayTime : 7000,
    type     : 'success'
 });};
});

	//document.getElementById("message").innerHTML = msg; 
</script>



</head>
<body>
<%if(request.getAttribute("signupmsg") != null) { %>
<script>
tval = 1;
</script>
<% } %>
<%if(request.getAttribute("error") != null) { %>
<script>
$(document).ready(function(){ tval = 0;$().toastmessage('showToast', {
    text     : "Please <strong>Login</strong> <br/>Session invalidated!",
    sticky   : false,
    stayTime : 5000,
    type     : 'warning'
});
});
</script>
<% } %>
	<div id="wrapper">
		<div id="header">
			<p><span>Contact:</span> <strong>Toll Free 1800-000-000</strong></p>
			<ul>
				<li class="no_bg"><a href="index.jsp">Home</a></li>
				<%--  <span style="color:#525961">|</span> --%>
				<li><a href="faq.jsp">FAQ</a></li>
				<%-- <span style="color:#525961">|</span> --%>	
				<%-- <span style="color:#525961">|</span> --%>
			</ul>
		</div>
		<a href="#" id="logo" title="civic sense"></a>
		
		<div id="sl" style="display:none;" onclick="this.style.display = 'none'"></div>
		
		<div id="container">
		<div id="slideshow">
		

		<ul id="slides">
			<li><img src="images/slide1.jpg" alt="cs1" /></li>
			<li><img src="images/slide2.jpg" alt="cs2" /></li>
			<li><img src="images/slide3.jpg" alt="cs3" /></li>
			<li><img src="images/slide4.jpg" alt="cs4" /></li>
		</ul>
		</div>
		</div>
		<div id="navigation">
			<ul>
				<li class="active"><a href="index.jsp">Home</a></li>
				<li><a href="citizen_home.jsp">Citizen</a></li>
				<li><a href="authority_home.jsp">Authority</a></li>
				<li><a href="admin_home.jsp">Administrator</a></li>
				<li><a href="ngohome.jsp">NGO</a></li>
				<li><a href="support.jsp">Support</a></li>
			</ul>
		</div>
		<div id="content">
			<div id="left_column">
				<div class="text">
					<h2>Sense - Futuristic e Governance</h2>
						<p><img src="images/eg.jpg" alt="egovernance"/>The ability to inbibe tranparency into the
						   governmental setup at the municipal corporation
						   level.
						</p>
						<a href="sense.html" class="continue" rel="#overlay" style="text-decoration:none">Continue Reading..</a>
						<!-- overlayed element -->
						  
						<div class="apple_overlay" id="overlay" style="display:none;">
  						<div class="contentWrap"></div>
						</div> 
						
						
				</div>
				<div class=" text alternative">
					<h2>We support NGOs</h2>
						<p><img src="images/ngo.jpg" alt="ngo"/>Extensive management
						is impossible without people who work just for the joy of service !
						Yes, we nurture what we call "Service without constraints" with the 
						active NGO groups.
						</p>
						<a href="ngointro.html" class="continue" rel="#overlay" style="text-decoration:none">Know your NGOs..</a>
				</div>
				<div class="text">
					<h2>Administrators</h2>
						<p><img src="images/admin.jpg" alt="admin"/>Exlcusive access to the
						decision makers for better e Governance.
						</p>
						<a href="index.jsp#linkpoint" class="continue" style="text-decoration:none">Administrator's login</a>
				</div>
			</div>
			
			
				
				
				
			<div id="right_column">
				<div class="heading">
                	<h2>Sign In</h2>
                	<a name="linkpoint"></a>
                </div>
                <div style="height=400px;">
            		<form id="signin" action="Login" method="post">
            			Username <input onchange="check_uname()" id="uname" name="username" type="text"/><br></br>
					   	Password <input onchange="check_pwd()" name="password" id="pwd" type="password" />
					   	<br/>
					   
					   	<table onclick="toggle_signup()">
					   		<tr><td onclick="check_radio()"><input id="citizen" type="radio" value="citizen" name="radio" class="styled"/></td><td>Citizen</td>
					   		<td rowspan="4"><input type="submit" id="sb" value="Sign in" onclick="return validate('${count}')"/></td>
					   		</tr>
					   		<tr><td onclick="check_radio()"><input id="authority" type="radio" value="authority" name="radio" class="styled"/></td><td>Authority</td></tr>
					   		<tr><td onclick="check_radio()"><input id="admin" type="radio" value="admin" name="radio" class="styled"/></td><td>Administrator<td></tr>
					   		<tr><td onclick="check_radio()"><input id="ngo" type="radio" value="ngo" name="radio" class="styled"/></td><td>NGO</td></tr>
					  	</table>
					  	
					  	<label id="label1" style="display:none">Word Verfication</label><input readonly=readonly type="text" style="background-image:url(images/image.gif);font-size:20px;font-weight:bold;display:none" id="captcha" ></input><br></br>
					  	<label id="label2" style="display:none">Enter as displayed</label><input type="text" id="input" onchange="check_captcha()" style="display:table;margin-bottom:10px;display:none"></input><br></br>
						<label id="errorlabel"></label>
						<%if(request.getAttribute("count")!=null)
						{
						int count=(Integer)request.getAttribute("count");
							%>
							<script>
							var errorlabel=document.getElementById("errorlabel");
							errorlabel.innerHTML="username or password doesn't match!";
							</script>
							<% if(count>=3)
							{%>
							<script>document.getElementById("label1").style.display="inline";
							document.getElementById("label2").style.display="inline";
							DrawCaptcha();
							document.getElementById("captcha").style.display="inline";
							document.getElementById("input").style.display="inline";
							</script>
							<%}} %>
						
					</form>
            		<form id="signup" action="#" method="post">
						<input type="submit" id="su" value="Sign up now !" onclick="return goto_jsp()" />
					</form>
                </div>
                <div class="splheading">
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