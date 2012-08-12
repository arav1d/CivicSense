<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Civic Sense| Account Creation</title>
<link type="text/css" href="css/reg_style_new.css" rel="stylesheet">
<link type="text/css" href="css/jquery-ui-1.8.18.custom.css" rel="stylesheet">
<script type="text/javascript" src="scripts/search.js"></script>
<script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
<script type="text/javascript" src="scripts/jquery.tagcloud.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.accordion.js"></script>
<title>Citizen Registration Form</title>
<style type="text/css">
sup{color:red;}
.table{background-color:lightblue;}
.label{color:red;}
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
</script>

<script type="text/javascript">$(function() {
	$( "#citizenoptions" ).accordion({
		collapsible: true
	});
	$( "#citizenoptions" ).accordion('activate',0);
});

//this function checks whether username is valid
function check_uname()
{
ajax_call();
var uname=document.getElementById("uname");
var unamelabel=document.getElementById("unamelabel");
var pattern=/^[a-zA-Z][a-zA-z0-9]+$/;
if(uname.value=="")
unamelabel.innerHTML="cannot be empty";
else if(!uname.value.match(pattern))
unamelabel.innerHTML="must start with an alphabet and contain only alphabets and numbers";
else
unamelabel.innerHTML="";
}

function check_pwd()
{
var pwd=document.getElementById("pwd");
var pwdlabel=document.getElementById("pwdlabel");
if(pwd.value=="")
pwdlabel.innerHTML="cannot be empty";
else if(pwd.value.length<6)
pwdlabel.innerHTML="must be minimum 6 characters";
else
pwdlabel.innerHTML="";
}


function check_cpwd()
{
var cpwd=document.getElementById("cpwd");
var pwd=document.getElementById("pwd");
var cpwdlabel=document.getElementById("cpwdlabel");
if(cpwd.value=="")
cpwdlabel.innerHTML="cannot be empty";
else if(cpwd.value!=pwd.value)
cpwdlabel.innerHTML="passwords not matching";
else
cpwdlabel.innerHTML="";
}



function check_fname()
{
var fname=document.getElementById("fname");
var fnamelabel=document.getElementById("fnamelabel");
var pattern=/^[a-zA-Z]+$/;
if(fname.value=="")
 fnamelabel.innerHTML="cannot be empty";
else if(!fname.value.match(pattern))
 fnamelabel.innerHTML="invalid name";
else
fnamelabel.innerHTML="";
}


function check_lname()
{
var lname=document.getElementById("lname");
var lnamelabel=document.getElementById("lnamelabel");
var pattern=/^[a-zA-Z]+$/;
if(lname.value=="")
 lnamelabel.innerHTML="cannot be empty";
else if(!lname.value.match(pattern))
lnamelabel.innerHTML="invalid name";
else
lnamelabel.innerHTML="";
}


function check_age()
{
var age=document.getElementById("age");
var agelabel=document.getElementById("agelabel");
var pattern=/^[0-9]+$/;
if(age.value=="")
 agelabel.innerHTML="cannot be empty";
else if(!age.value.match(pattern))
agelabel.innerHTML="invalid age";
else if(age.value<18)
agelabel.innerHTML="must be atleast 18 years of age";
else
agelabel.innerHTML="";
}


function check_phone()
{
var phone=document.getElementById("phone");
var phonelabel=document.getElementById("phonelabel");
var pattern=/^[0-9]+$/;
if(phone.value=="")
	phonelabel.innerHTML="cannot be empty";
else if (!phone.value.match(pattern))
phonelabel.innerHTML="invalid phone number";
else
{
if(phone.value.length==8 || phone.value.length==10)
phonelabel.innerHTML="";
else
phonelabel.innerHTML="invalid phone number";
}
}

function check_email()
{
var email=document.getElementById("email");
var emaillabel=document.getElementById("emaillabel");
var pattern=/^[a-z][a-z0-9._]*[@][a-z]+[.][a-z]+$/;
if(email.value=="")
	emaillabel.innerHTML="cannot be empty";
else if (!email.value.match(pattern))
emaillabel.innerHTML="invalid email id";
else
emaillabel.innerHTML="";
}

function validate()
{
var labels=document.getElementsByClassName("label");

check_zone();check_ward();check_uname();check_pwd();check_fname();check_lname();check_age();
check_phone();check_email();check_door();check_street();check_cpwd();check_sex();check_dept();

for(var i=0;i<labels.length;i++)
	{
	if(labels[i].innerHTML!="")
		return false;
	}
	return true;
	
}


function check_sex()
{
var male=document.getElementById("male");
var female=document.getElementById("female");
var sexlabel=document.getElementById("sexlabel");

if(male.checked==0 && female.checked==0)
	sexlabel.innerHTML="select your gender";
else
	sexlabel.innerHTML="";
}


function check_zone()
{
	ajax_call();
	var zone=document.getElementById("zone");	
	var zonelabel=document.getElementById("zonelabel");
	if(zone.value==0)
		zonelabel.innerHTML="select your zone";
	else
		zonelabel.innerHTML="";
}


function check_ward()
{
	ajax_call();
	var ward=document.getElementById("ward");	
	var wardlabel=document.getElementById("wardlabel");
	if(ward.value==0)
		wardlabel.innerHTML="select your ward";
	else
		wardlabel.innerHTML="";
}


function check_dept()
{
	ajax_call();
	var dept=document.getElementById("dept");	
	var deptlabel=document.getElementById("deptlabel");
	if(dept.value==0)
		deptlabel.innerHTML="select your dept";
	else
		deptlabel.innerHTML="";
}

function check_addr()
{
var addr=document.getElementById("addr");
var addrlabel=document.getElementById("addrlabel");
var pattern=/^[ a-zA-Z0-9.,-/\n]+$/;
if(addr.value=="")
 addrlabel.innerHTML="cannot be empty";
else if(!addr.value.match(pattern))
 addrlabel.innerHTML="cannot contains special characters other than ,.-/";
else if(addr.value.length>300)
	addrlabel.innerHTML="cannot exceed more than 300 characters";
else
addrlabel.innerHTML="";
}



function ajax_call()
{
var uname=document.getElementById("uname").value;
var zone=document.getElementById("zone").value;
var ward=document.getElementById("ward").value;	
var dept=document.getElementById("dept").value;
var unamelabel=document.getElementById("unamelabel");
	
if(uname!="" && zone!="0" && ward!="0" && dept!="0")
{
var xhr=new XMLHttpRequest();//creating a new XMLHttpReuest
	xhr.open("GET","AJAX?uname="+uname+"&zone="+zone+"&ward="+ward+"&dept="+dept+"&type=authcreation",true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200)
		{
			result=xhr.responseText;
		 	switch(result)
		 	{
		 	case "-1":unamelabel.innerHTML="an authority has already been appointed for this zone,ward and dept";
		 			
		 			break;
		 	case "0":unamelabel.innerHTML="username already exists";
		
		 			break;
		 	case "1":unamelabel.innerHTML="";
		 			break;
		 	}
		}};
		xhr.send();
}
}

function validate()
{
var labels=document.getElementsByClassName("label");

check_zone();check_ward();check_uname();check_pwd();check_fname();check_lname();
check_phone();check_email();check_cpwd();check_sex();check_dept();check_addr();

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
document.getElementById("uname").value="";
document.getElementById("fname").value="";
document.getElementById("lname").value="";
document.getElementById("pwd").value="";
document.getElementById("cpwd").value="";
document.getElementById("male").checked=false;
document.getElementById("female").checked=false;
document.getElementById("age").value="";
document.getElementById("phone").value="";
document.getElementById("email").value="";
document.getElementById("addr").value="";
document.getElementById("dept").options[0].selected=true;
document.getElementById("zone").options[0].selected=true;
populate_ward();
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



//this function populate the wards as per the zone selected
function populate_ward()
{
var zone=document.getElementById("zone").value;//getting the zone combo box element
var ward=document.getElementById("ward"); //getting the ward combo box element
var zone0=new Array("--Choose--");
var zone1=new Array("--Choose--","Kodungaiyur (West)","Kodungaiyur (East)","Dr.Radhakrishnan Nagar (North)","Dr.Radhakrishnan Nagar","Cheriyan Nagar (North)","Jeeva Nagar (North)","Cheriyan Nagar (South)","Jeeva Nagar (South)","Korukkupet","Mottai Thottam","Kumarasamy Nagar (South)","Dr.Radhakrishnan Nagar (South)","Kumarasamy Nagar (North)","Vijayaragavalu Nagar (West)");
var zone2=new Array("--Choose--","Tondiarpet","Sanjeevirayanpet","Grace Garden","Ma-Po-Si Nagar","Royapuram","Singarathottam","Narayanappa Thottam","Old Washermenpet","Meenakshiammanpet","Kondithope","Sevenwells (North)","Amman Koil","Muthialpet","Vallalseethakathi Nagar","Kachaleeswarar Nagar","Sevenwells (South)","Sowcarpet","Basin Bridge");
var zone3=new Array("--Choose--","Vyasarpet (South)","Vyasarpet (North)","Perambur (North)","Perambur (East)","Elango Nagar","Perambur (South)","Thiru-Vi-Ka Nagar","Wadia Nagar","Dr.Sathyavanimuthu Nagar","Pulianthope","Dr.Besant Nagar","Pedhunayakanpet","Perumal Koil Thottam","Thattankulam","Choolai","Poonga Nagar","Elephant Gate","Edapalayam");
var zone4=new Array("--Choose--","Agaram (North)","Sembiam","Siruvalloor","Nagammai Ammaiyar Nagar","Agaram (South)","Vidhudalai Gurusami Nagar","Ayanavaram","Nagammaiammaiyar Nagar (South)","Panneer Selvam Nagar","Maraimalai Adigal Nagar","Maraimalai Adigal Nagar (South)","Purasawalkam","Kolathur","Villiwakkam (North)");
var zone5=new Array("--Choose--","Villiwakkam (South)","Virugambakkam (North)","Anna Nagar (West)","Anna Nagar (Central)","Anna Nagar (East)","Shenoy Nagar","Kilpauk (North)","Gangadeeswarar Koil","Kilpauk (South)","Amanjikarai (North)","Amanjikarai (Central)","Amanjikarai (West)","Periyar Nagar (North)","Periyar Nagar (West)","Nungambakkam");
var zone6=new Array("--Choose--","Adikesavapuram","Nehru Nagar","Chintadripet","Komaleeswaranpet","Balasubramanya Nagar","Thiruvotteeswaranpet","Natesan Nagar","Chepauk","Zambazaar","Umaru Pulavar Nagar","Triplicane","Marina","Krishnampet","Bharathi Nagar","Azad Bgr (North)","Bharthidasan Nagar","Azas Nagar (South)","Vivekananda Puram");
var zone7=new Array("--Choose--","Ajnugam Ammaiyar Nagar","Kosappet W(G)","Pattalam - Sc(G)","Anbazhagan Nagar","Perumalpet","Kannappar Nagar W(G)","Pattalam","Chetpet","Egmore","Pudupet","Ko-Su-Mani Nagar","Nakeerar Nagar","Thousand Lights","Azhagiri Nagar","Amir Mahal","Royapettah","Teynampet");
var zone8=new Array("--Choose--","Sathyamurthy Nagar","Alwarpet (North)","Alwarpet (South)","Vadapalani (West)","Vadapalani (East)","Kalaivanar Nagar","Navalar Nedunchezian Nagar (West)","Navalar Nedunchezian Nagar (West)","Ashok Nagar","M.G.R. Nagar","Kamaraj Nagar (North)","Kamaraj Nagar (South)","Thyagaraya Nagar","Rajaji Nagar","Virugambakkam (South)","Saligarmam");
var zone9=new Array("--Choose--","Kodambakkam (North)","Kodambakkam (South)","Saidapet","Kumaran Nagar (North)","Kumaran Nagar (South)","Saidapet (West)","Kalaingar Karunanidhi Nagar","V O C Nagar","G D Naidu Nagar (East)","G. D Naidu Nagar (West)","Guindy (West)","Guindy (East)");
var zone10=new Array("--Choose--","Beemannapettai","Thiruvalluvar Nagar","Madavaperumal Puram","Karaneeswarpuram","Santhome","Mylapore","Avvai Nagar (South)","Raja Annamalai Puram","Avvai Nagar (South)","Adyar (West)","Adyar (East)","Velachery","Thiruvanmiyur (West)","Thiruvanmiyur (East)");


switch(zone)
{
case "0":  ward.innerHTML="";
addOption(ward,zone0);
break;
case "Zone I Tondiarpet":  ward.innerHTML="";
addOption(ward,zone1);
break;
case "Zone II Basin Bridge":  ward.innerHTML="";
addOption(ward,zone2);
break;
case "Zone III Pulianthope":  ward.innerHTML="";
addOption(ward,zone3);
break;
case "Zone IV Ayanavaram": ward.innerHTML="";
addOption(ward,zone4);
break;
case "Zone V Kilpauk":  ward.innerHTML="";
addOption(ward,zone5);
break;
case "Zone VI Ice House":  ward.innerHTML="";
addOption(ward,zone6);
break;
case "Zone VII Nungambakkam":  ward.innerHTML="";
addOption(ward,zone7);
break;
case "Zone VIII Kodambakkam":  ward.innerHTML="";
addOption(ward,zone8);
break;
case "Zone IX Saidapet":  ward.innerHTML="";
addOption(ward,zone9);
break;
case "Zone X Adyar": ward.innerHTML="";
addOption(ward,zone10);
break;
}
}

$.fn.tagcloud.defaults = {
		  size: {start: 10, end: 20, unit: 'px'},
		  color: {start: '#6699ff', end: '#ffffff'}
		};

$(function () {
	$('#whatever a').tagcloud();
});


</script>
<body>
<div id="wrapper">
		<div id="header">
			<p><span>Contact:</span> <strong>Toll Free 1800-000-000</strong></p>
			<ul>
				<li class="no_bg"><a href="adminHome.jsp">Home</a></li>
				<li><a href="index.jsp">Sign Out</a></li>
			</ul>
		</div>
		<a href="adminHome.jsp" id="logo" title="civic sense"></a>
		<div id="navigation">
			<span>Registration of Municipal Authority</span>
		</div>
<div id="content">
		
			<form id="regform" action="AuthorityAccount" method="post">
				<h3 style="color:#91bff9;">Instructions: Please fill the authority account details below and click the 'Register' button at the bottom.
<br />(<sup>*</sup>indicates required fields)</h3>
			<hr />
				<div class="text">
					<h2>Account Details</h2>
						<table class="table" width="100%">

<tr>
<td>Username:<sup>*</sup></td>
<td><input type="text" name="username" id="uname" size="30" maxlength="30" onchange="check_uname()"/></td>
</tr>

<tr>
<td></td>
<td><label class="label" id="unamelabel"></label></td>
</tr>



<tr>
<td>Password:<sup>*</sup></td>
<td><input type="password" name="password" id="pwd" size="30" maxlength="30" onchange="check_pwd()"/> </td>
<td>Confirm Password:<sup>*</sup></td>
<td><input type="password" name="cpwd" id="cpwd" size="30" maxlength="30" onchange="check_cpwd()"/> </td>
</tr>

						<tr>
						<td></td>
					    <td><label class="label" id="pwdlabel"></label></td>
					    <td></td>
					    <td><label class="label" id="cpwdlabel"></label></td>
						</tr>
						

						</table>
				</div>
				<div class=" text alternative">
					<h2>Personal Details</h2>
					<table class="table" width="100%">
<tr>
<td>First Name:<sup>*</sup></td>
<td><input type="text" name="fname" id="fname" size="30" maxlength="30" onfocus="populate_ward()" onchange="check_fname()"/> </td>
<td>Last Name:<sup>*</sup></td>
<td><input type="text" name="lname" id="lname" size="30" maxlength="30" onchange="check_lname()"/></td>
</tr>

					<tr>
					<td></td>
					<td><label class="label" id="fnamelabel"></label></td>
					<td></td>
					<td><label class="label" id="lnamelabel"></label></td>
				    </tr>


<tr>
<td>Sex:<sup>*</sup></td>
<td onclick="check_sex()"><input type="radio" value="male" name="radio" id="male" class="styled"/> Male<br/><br/><input type="radio" value="female" name="radio" id="female" class="styled" /> Female</td>

</tr>


					
					<tr>
					<td></td>
					<td><label class="label" id="sexlabel"></label></td>
					<td></td>
					<td><label class="label" id="agelabel"></label></td>
				    </tr>
					


<tr>
<td>Phone:<sup>*</sup></td>
<td><input type="text" name="phNo" id="phone" size="30" maxlength="10" onchange="check_phone()"/> </td>
<td>Email:<sup>*</sup></td>
<td><input type="text" name="email" id="email" size="40" maxlength="40" onchange="check_email()"/></td>
</tr>


					<tr>
					<td></td>
					<td><label class="label" id="phonelabel"></label></td>
					<td></td>
					<td><label class="label" id="emaillabel"></label></td>
				    </tr>
					
					</table>
				</div>
				<div class="text">
					<h2>Office Details</h2>
						<table class="table" id="location" width="100%">
<tr>

<td>Zone:<sup>*</sup></td>
<td><input  style="width:200" id="zone" name="zone" readonly=readonly value = "${user.zone}" /></td>
</tr>
<tr>
					<td></td>
					<td><label class="label" id="zonelabel"></label></td>
</tr>
<tr>
<td>Area/Ward:<sup>*</sup></td>
<td><select style="width:200" id="ward" name="ward"  onchange="check_ward()">
<option   value ="0" >-- Choose-- </option>
</select></td>
</tr>
<tr>
<td></td>
					<td><label class="label" id="wardlabel"></label></td>
</tr>
<tr>
<td>Department:<sup>*</sup></td>
<td><select style="width:200" name="dept" id="dept" onchange="check_dept()">
<option   value ="0" >-- Choose-- </option>
<option value="Health">Health</option>
<option value="General">General</option>
<option value="Engineering">Engineering</option>
<option value="Revenue">Revenue</option>
<option value="Solid Waste Management">Solid Waste Management</option>
</select></td>
</tr>
<tr>
					<td></td>
					<td><label class="label" id="deptlabel"></label></td>
				    </tr>


<tr>
<td valign="top">Office Address:<sup>*</sup></td>
<td><textarea name="offAddr" id="addr" rows="4" cols="30" onchange="check_addr()"></textarea></td>
<td><label class="label" id="addrlabel"></label></td>
</tr>

</table>
				</div>
			<input type="submit" name="submit" id="register" value="Register" onclick="return validate()"/>
<input type="reset" name="reset" id="reset" value="Clear Fields" onclick="javascript:reset_fields()"/>
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
