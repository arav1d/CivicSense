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
<style type="text/css">
/*h1{text-align:center;background-color:lightgreen}
h4{text-align:center;color:darkblue}
h3{background-color:lightgreen}*/
h5{color:red;}
.error{color:red;}
sup{color:red;}
#sploc,#compdesc{resize:none;}
#comptype,#location,#comptitdesc{background-color:lightblue;}
</style>
<script>
	$(function() {
		$( "input:submit").button();
		$("input:reset").button();
	});
	
	$(function() {
		$( "#citizenoptions" ).accordion({
			collapsible: true
		});
		$('#citizenoptions').accordion('activate',2);
	});
</script>

<title>CivicSense | Complaint Form</title>

<script type="text/javascript">


//this function clears the fields
function reset_fields()
{
var sploc=document.getElementById("sploc");
var combo1=document.getElementById("complaint_category");
//var combo2 = document.getElementById("complaint_type");
var othercomp=document.getElementById("othercomp");
var comptitle=document.getElementById("comptitle");
var compdesc=document.getElementById("compdesc");

sploc.value="";
othercomp.value="";
comptitle.value="";
compdesc.value="";
combo1.options[0].selected=true;
populate_complaint();
}



//this function populates the options in the array into the selectbox combo box
function addOption(selectbox,options_array)
{
for(var i=0;i<options_array.length;i++)
{
var opt=document.createElement("OPTION");
opt.text=options_array[i];
if(i==0)
	opt.value=0;
else
	opt.value=options_array[i];
selectbox.options.add(opt);
}
}

//this function populates the options in the complaint combo depending upon the complaint dept
function populate_complaint()
{
check_dept();
var combo1=document.getElementById("dept");//getting the complaint category combo box
var combo2=document.getElementById("type");//getting the complaint type combo box
var comp0=new Array("--Choose--");

var comp1=new Array("--Choose--","Complaints regarding  Cleanliness of Toilets in Shopping complex",
"Complaints regarding  Cleanliness of Toilets in Theatre",
"Complaints regarding  Dispensary ",
"Complaints regarding CDH",
"Complaints regarding CWC",
"Complaints regarding burial ground",
"Complaints regarding public toilets",
"Complaints regarding quality of food in Hotels",
"Complaints regarding unauthorised restaurants",
"Death of Stray Animals",
"Dog menace ",
"Flies menace at Kodungaiyur Dumping Ground",
"Flies menace at Perungudi Dumping Ground",
"Illegal slaughtering",
"Improper Sweeping",
"Issue of Birth and Death Certificate",
"Mosquito menace ",
"Public Health/Dengue/Malaria/Gastro-enteritis",
"Road Side Eateries",
"Slaughter House",
"Stray Pigs",
"Stray cattle",
"Transfer Station Smell",
"Unauthorised sale of meat and meat product",
"Unhygienic and improper transport of meat and livestock",
"Unsanitary conditions on the road");

var comp2=new Array("--Choose--",
"Change of address in Electoral Roll",
"Complaints regarding Schools",
"Issue of Colour TV",
"Issue of Voter ID",
"Name Error (Spelling Related)",
"Name not found in ElectoralRoll",
"Sanction of financial assistance under Moovalur thirumana thittam",
"Unauthorised Advt. Boards");


var comp3=new Array("--Choose--","Building plan sanction","Cleaning of water table",
"Complaints regarding Bridges/Flyovers/Subways",
"Complaints regarding Centre Median",
"Complaints regarding Park",
"Complaints regarding Play grounds",
"Complaints regarding Traffic Island",
"Complaints regarding any other COC Buildings",
"Complaints regarding community hall",
"Covering of Man holes of SWD",
"Damage to the  Electric Pole",
"Desilting of Canal",
"Desilting of Drain",
"Disposal of removed silt on the Road",
"Electric Shock due to street light",
"Encroachment on the public property",
"Formation of New Road",
"Illegal draining of sewage to SWD/Open site",
"New Drain Construction",
"New Street light",
"Non Burning of Street Lights",
"Obstruction of Trees",
"Obstruction of water flow",
"Open Air Defunction",
"Parking Issue",
"Poor quality of work",
"Pot hole fill up/Repairs to the damage surface",
"Removal of Debris",
"Removal of fallen trees",
"Removal of shops in the footpath",
"Repairs to existing footpath",
"Repairs to the SWD",
"Request to provide footpath",
"Request to relay the Road",
"Shifting of Street light Pole",
"Shifting of garbage bin",
"Slow progress of work",
"Stagnation of water",
"Unauthorised / Illegal construction",
"Unauthorised tree Cutting",
"Violation of DCR/Building bye laws");


var comp4=new Array("--Choose--",
"Complaints regarding Voter list",
"Complaints related to issue of all types of license",
"Complaints related to property tax",
"Inclusion, delection of correction in the Voter list");

var comp5=new Array("--Choose--",
"Absenteesim of door to door garbage collector",
"Absenteesim of sweepers",
"Bio Medical waste/Health hazard waste removal",
"Broken Bin",
"Burning of garbage",
"Burning of garbage at Kodungaiyur Dumping Ground",
"Burning of garbage at Perungudi Dumping Ground",
"Garbage lorry with out Net",
"Nuisance by garbage tractors or trucks",
"Over flowing of garbage bins ",
"Provision of garbage bin",
"Removal of garbage",
"Spilling of Garbage from lorry");


switch(combo1.value)
{
case "0":  combo2.innerHTML="";
           addOption(combo2,comp0);
	   break;
case "Health":  combo2.innerHTML="";
           addOption(combo2,comp1);
	   break;
case "General":  combo2.innerHTML="";
           addOption(combo2,comp2);
	   break;
case "Engineering":  combo2.innerHTML="";
           addOption(combo2,comp3);
	   break;
case "Revenue":  combo2.innerHTML="";
           addOption(combo2,comp4);
	   break;
case "Solid Waste Management":  combo2.innerHTML="";
           addOption(combo2,comp5);
	   break;

}

}



function check_dept()
{
	var dept=document.getElementById("dept");	
	var deptlabel=document.getElementById("deptlabel");
	if(dept.value==0)
		deptlabel.innerHTML="select the complaint department";
	else
		deptlabel.innerHTML="";
}


function check_type()
{
	var type=document.getElementById("type");	
	var typelabel=document.getElementById("typelabel");
	if(type.value==0)
		typelabel.innerHTML="select the complaint complaint";
	else
		typelabel.innerHTML="";
}

function check_sploc()
{
var sploc=document.getElementById("sploc");
var sploclabel = document.getElementById("sploclabel");
var pattern=/^[ a-zA-Z0-9.,-/\n]+$/;
if(sploc.value=="")
 sploclabel.innerHTML="cannot be empty";
else if(!sploc.value.match(pattern))
 sploclabel.innerHTML="cannot contains special characters other than ,.-/";
else if(sploc.value.length>300)
	sploclabel.innerHTML="cannot exceed more than 300 characters";
else
sploclabel.innerHTML="";
}


function check_desc()
{
	var desc=document.getElementById("desc");
	var desclabel=document.getElementById("desclabel");
	var pattern=/^[ a-zA-Z0-9.,-/\n]+$/;
	if(desc.value=="")
	 desclabel.innerHTML="cannot be empty";
	else if(!desc.value.match(pattern))
	 desclabel.innerHTML="cannot contains special characters other than ,.-/";
	else if(desc.value.length>300)
		desclabel.innerHTML="cannot exceed more than 300 characters";
	else
	desclabel.innerHTML="";
	}


function validate()
{
var labels=document.getElementsByClassName("error");

check_sploc();check_dept();check_desc();check_type();

for(var i=0;i<labels.length;i++)
	{
	if(labels[i].innerHTML!="")
		return false;
	}
	return true;
	
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
				<li class="no_bg"><a href="citizenHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
		</div>
		<a href="citizenHome.jsp" id="logo" title="civic sense"></a>
		
		<div id="sl" style="display:none;" onclick="this.style.display = 'none'"></div>
<%-- ----------------------------------------------Title--------------------------------------------------- --%>		
		<div id="navigation">
			<span>File a Complaint</span>
		</div>
		<div id="content">
		
			<form id="regform" action="CitizenComplaint" method="post">
				<h3 style="color:#91bff9;">Instructions: Please fill your complaint details below and click the 'Submit Complaint' button at the bottom. You will  be given a 'Complaint Number' upon submitting the complaint that you can use to track the complaint.
				<br />(<sup>*</sup>indicates required fields)</h3>
				<hr />
				<h4 style="color:#f14a1d;">Note:Please note that you can post complaints only related to your Ward within ur Zone</h4>	
				<div class="text">
					<h2>Complaint Location Details</h2>
<%-- ----------------------------------------------------Location Details------------------------------------------------- --%>
					<table id="location" width="100%">

					<tr>
					<td>Zone where you live: </td>
					<td><input type="text" readonly size="30" name="zone" id="zone" value="${zone}" /></td>
					</tr>


					<tr>
					<td>Ward you belong to: </td>
					<td><input type="text" readonly size="30" name="ward" id="ward" value="${ward}"/></td>
					</tr>

					<tr>
					<td valign="top">Enter the specific location:<sup>*</sup> </td>
					<td><textarea id="sploc" name="sploc" rows="4" cols="25" onchange="check_sploc()"></textarea></td>
					</tr>
					
					<tr>
					<td></td>
					<td><label class="error" id="sploclabel"></label></td>
					</tr>
					</table>

				</div>
				<div class=" text alternative">
					<h2>Complaint Types</h2>
<%-----------------------------------------Complaint Types-------------------------------------------------%>

					<table width="100%" id="comptype" style="overflow:auto;">
					<tr>

					<td>Complaint Department:<sup>*</sup></td>
					<td>
					<select style="Width:200" id="dept" name="complaint_category" onchange="populate_complaint()">
					<option   value ="0" >-- Choose-- </option>
					<option value="Health">Health</option>
					<option value="General">General</option>
					<option value="Engineering">Engineering</option>
					<option value="Revenue">Revenue</option>
					<option value="Solid Waste Management">Solid Waste Management</option>
					</select>
					</td>
					</tr>
					
					<tr>
					<td></td>
					<td><label class="error" id="deptlabel"></label></td>
					</tr>

					<tr>	
					<td>Select Complaint:<sup>*</sup></td>
					<td><select id="type" name="complaint_type" style="Width:350" onchange="check_type()">
					<option   value ="0" >-- Choose-- </option>
					</select></td>
					</tr> 
					
					 <tr>
					 <td></td>
					<td><label class="error" id="typelabel"></label></td>
					</tr>

					</table>
				</div>
				<div class="text">
					<h2>Complaint Description</h2>
<%-- --------------------------------------Complaint Details---------------------------------------- --%>

					<table id="comptitdesc"  width="100%">
					<tr>
					<td>Complaint Description:<sup>*</sup></td>
					<td><textarea id="desc" name="compdesc" rows="4" cols="50" onchange="check_desc()"></textarea></td>
					</tr>
					
					<tr>
					<td></td>
					<td><label class="error" id="desclabel"></label></td>
					</tr>
					</table>
				</div>
				<input type="reset"  id="reset" value="Reset" onclick="reset_fields();"></input>	
				<input type="submit" id="complain" value="Complain" onclick="return validate()"></input>			
			</form>
			<div id="right_column">
			<div id="citizenoptions">
			<h3><a href="#">Complaint</a></h3>
			<div>
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
					<%	for(int i = 0;i < grp.size(); ++i){		%>
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
                
                <div class="heading">
                	<h2>Call Toll-Free</h2>
                    	<img src="images/phone.png" alt="" />
                </div> 
                	<ul>
            			<li><span>1800-0989-1400</span>&nbsp; South Chennai</li>
                        <li><span>1800-0989-1500</span>&nbsp; North Chennai</li>
            		</ul>
			</div>
			</div>
</div>
<div id="footer">
		<div id="footer_content">
			<ul>
				<li class="no_bg"><a href="index.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
			<p> &copy; 2012 Civic Sense - Team. All wrongs unreserved. </p>
		</div>
	</div>

</body>
</html>