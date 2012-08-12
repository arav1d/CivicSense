<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Civic Sense | Administrator</title>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet">
<link type="text/css" href="css/jquery.toastmessage.css" rel="stylesheet"/>

<%session.invalidate(); %>
<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.all.js"></script>
<script type="text/javascript" src="scripts/slide.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<script type="text/javascript" src="scripts/jquery.toastmessage.js"></script>
<script type="text/javascript" src="scripts/search.js"></script>

<script>
	$(function() {
		$( "input:submit").button();
	});
	
	$(document).ready(function(){$().toastmessage('showToast', {
	       text     : 'Control the system !<br/><br/>',
	       sticky   : false,
	       stayTime	: 6000,
	       position : 'top-right',
	       type     : 'notice'
	    });
});

</script>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<p><span>Contact:</span> <strong>Toll Free 1800-000-000</strong></p>
			<ul>
				<li class="no_bg"><a href="index.jsp">Home</a></li>
				<%--  <span style="color:#525961">|</span> --%>
				<li><a href="faq.jsp">FAQ</a></li>
			</ul>
		</div>
		<a href="index.jsp" id="logo" title="civic sense"></a>
		
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
				<li ><a href="index.jsp">Home</a></li>
				<li ><a href="citizen_home.jsp">Citizen</a></li>
				<li ><a href="authority_home.jsp">Authority</a></li>
				<li class="active"><a href="#">Administrator</a></li>
				<li><a href="ngohome.jsp">NGO</a></li>
				<li><a href="support.jsp">Support</a></li>
			</ul>
		</div>
		<div id="content">
			<div id="left_column">
				<div class="text">
					<h2>Filter Scrolls</h2>
						<p><img src="images/scroll.jpg" alt="scrolls"/>The complaints are easy to filter
						when they are presented on a scrollable interface !</p>
						<p>
						Invalidated complaints are filtered  by selecting
						them from the scrolls, as they are no more taken care by the authorities.
						</p>
				</div>
				<div class=" text alternative">
					<h2>Create Memos</h2>
						<p><img src="images/memo.jpg" alt="memo"/>The system is regularised by
						issuing memos to those authorities with number of negative feedbacks 
						above the tolerance level.
						</p>
				</div>
				<div class="text">
					<h2>Create authority access</h2>
						<p><img src="images/access.jpg" alt="access"/>This is essential as a part
						of any e -governance setup.There can be authority accounts generated.
						</p>
						<a href="#" class="continue">Administrator's login</a>
				</div>
			</div>
			
			
				
				
				
			<div id="right_column">
				
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