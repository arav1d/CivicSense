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
<script type="text/javascript" src="scripts/jquery.ui.core.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.widget.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.button.js"></script>
<title>Civic Sense | Sign Up</title>
<style type="text/css">
sup{color:red;}
.label{color:red;}
.table{background-color:lightblue;}
</style>

<script>
	$(function() {
		$( "input:submit").button();
		$( "input:reset").button();
	});
</script>

<script type="text/javascript">

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

function check_vid()
{
ajax_call();
var vid=document.getElementById("vid");
var vidlabel=document.getElementById("vidlabel");
var pattern=/^[A-Z]{2}[0-9]{6}$/;
if(vid.value=="")
vidlabel.innerHTML="cannot be empty";
else if(!vid.value.match(pattern))
vidlabel.innerHTML="enter proper voter id ex:AB123456";
else
vidlabel.innerHTML="";
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
ajax_call();
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



function check_door()
{
var door=document.getElementById("door");
var doorlabel=document.getElementById("doorlabel");
var pattern=/^[0-9a-zA-z]+$/;
if(door.value=="")
 doorlabel.innerHTML="cannot be empty";
else if(!door.value.match(pattern))
doorlabel.innerHTML="invalid door no";
else
doorlabel.innerHTML="";
}

function check_street()
{
var street=document.getElementById("street");
var streetlabel=document.getElementById("streetlabel");
var pattern=/^[0-9 a-zA-Z]+$/;
if(street.value=="")
 streetlabel.innerHTML="cannot be empty";
else if(!street.value.match(pattern))
streetlabel.innerHTML="invalid street  name";
else
streetlabel.innerHTML="";
}


function validate()
{
var labels=document.getElementsByClassName("label");

check_zone();check_ward();check_uname();check_vid();check_pwd();check_fname();check_lname();check_age();
check_phone();check_email();check_door();check_street();check_cpwd();check_sex();

for(var i=0;i<labels.length;i++)
	{
	if(labels[i].innerHTML!="")
		return false;
	}
}


function ajax_call()
{
	var uname=document.getElementById("uname").value;
	var vid=document.getElementById("vid").value;
	var zone=document.getElementById("zone").value;
	var ward=document.getElementById("ward").value;
	var fname=document.getElementById("fname").value;
	var unamelabel=document.getElementById("unamelabel");
	var vidlabel=document.getElementById("vidlabel");
	if(uname!="" && fname!="" && vid!="" && zone!="0" && ward!="0")
	{
	var xhr=new XMLHttpRequest();//creating a new XMLHttpReuest
	xhr.open("GET","AJAX?uname="+uname+"&vid="+vid+"&fname="+fname+"&zone="+zone+"&ward="+ward+"&type=signup",true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200)
		{
			result=xhr.responseText;//getting the response text and parsing to int
			 switch(result)
			 	{
			 	case "-1":unamelabel.innerHTML="username already exists";
			 		
			 			break;
			 	case "0":vidlabel.innerHTML="input details not matching with ur voter id details";
			 		
			 			break;
			 	case "1":vidlabel.innerHTML="";
	 			unamelabel.innerHTML="";
			 			break;
			 	}
			}};
			xhr.send();
	}
}

function check_sex()
{
var male=document.getElementById("male");
var female=document.getElementById("female");
var sexlabel=document.getElementById("sexlabel");

if(male.checked==0 && female.checked==0)
	sexlabel.innerHTML="select ur gender";
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


//this function clears the fields
function reset_fields()
{
document.getElementById("uname").value="";
document.getElementById("vid").value="";
document.getElementById("fname").value="";
document.getElementById("lname").value="";
document.getElementById("pwd").value="";
document.getElementById("cpwd").value="";
document.getElementById("male").checked=false;
document.getElementById("female").checked=false;
document.getElementById("age").value="";
document.getElementById("phone").value="";
document.getElementById("email").value="";
document.getElementById("door").value="";
document.getElementById("street").value="";
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
opt.value =options_array[i];
selectbox.options .add(opt);
}
}


//this function populate the wards as per the zone selected
function populate_ward()
{
var zone=document.getElementById("zone");//getting the zone combo box element
var ward=document.getElementById("ward"); //getting the ward combo box element

var zone0=new Array("--------Choose--------");
var zone1=new Array("--------Choose--------","Kodungaiyur (West)","Kodungaiyur (East)","Dr.Radhakrishnan Nagar (North)","Dr.Radhakrishnan Nagar","Cheriyan Nagar (North)","Jeeva Nagar (North)","Cheriyan Nagar (South)","Jeeva Nagar (South)","Korukkupet","Mottai Thottam","Kumarasamy Nagar (South)","Dr.Radhakrishnan Nagar (South)","Kumarasamy Nagar (North)","Vijayaragavalu Nagar (West)");
var zone2=new Array("--------Choose--------","Tondiarpet","Sanjeevirayanpet","Grace Garden","Ma-Po-Si Nagar","Royapuram","Singarathottam","Narayanappa Thottam","Old Washermenpet","Meenakshiammanpet","Kondithope","Sevenwells (North)","Amman Koil","Muthialpet","Vallalseethakathi Nagar","Kachaleeswarar Nagar","Sevenwells (South)","Sowcarpet","Basin Bridge");
var zone3=new Array("--------Choose--------","Vyasarpet (South)","Vyasarpet (North)","Perambur (North)","Perambur (East)","Elango Nagar","Perambur (South)","Thiru-Vi-Ka Nagar","Wadia Nagar","Dr.Sathyavanimuthu Nagar","Pulianthope","Dr.Besant Nagar","Pedhunayakanpet","Perumal Koil Thottam","Thattankulam","Choolai","Poonga Nagar","Elephant Gate","Edapalayam");
var zone4=new Array("--------Choose--------","Agaram (North)","Sembiam","Siruvalloor","Nagammai Ammaiyar Nagar","Agaram (South)","Vidhudalai Gurusami Nagar","Ayanavaram","Nagammaiammaiyar Nagar (South)","Panneer Selvam Nagar","Maraimalai Adigal Nagar","Maraimalai Adigal Nagar (South)","Purasawalkam","Kolathur","Villiwakkam (North)");
var zone5=new Array("--------Choose--------","Villiwakkam (South)","Virugambakkam (North)","Anna Nagar (West)","Anna Nagar (Central)","Anna Nagar (East)","Shenoy Nagar","Kilpauk (North)","Gangadeeswarar Koil","Kilpauk (South)","Amanjikarai (North)","Amanjikarai (Central)","Amanjikarai (West)","Periyar Nagar (North)","Periyar Nagar (West)","Nungambakkam");
var zone6=new Array("--------Choose--------","Adikesavapuram","Nehru Nagar","Chintadripet","Komaleeswaranpet","Balasubramanya Nagar","Thiruvotteeswaranpet","Natesan Nagar","Chepauk","Zambazaar","Umaru Pulavar Nagar","Triplicane","Marina","Krishnampet","Bharathi Nagar","Azad Bgr (North)","Bharthidasan Nagar","Azas Nagar (South)","Vivekananda Puram");
var zone7=new Array("--------Choose--------","Ajnugam Ammaiyar Nagar","Kosappet W(G)","Pattalam - Sc(G)","Anbazhagan Nagar","Perumalpet","Kannappar Nagar W(G)","Pattalam","Chetpet","Egmore","Pudupet","Ko-Su-Mani Nagar","Nakeerar Nagar","Thousand Lights","Azhagiri Nagar","Amir Mahal","Royapettah","Teynampet");
var zone8=new Array("--------Choose--------","Sathyamurthy Nagar","Alwarpet (North)","Alwarpet (South)","Vadapalani (West)","Vadapalani (East)","Kalaivanar Nagar","Navalar Nedunchezian Nagar (West)","Navalar Nedunchezian Nagar (West)","Ashok Nagar","M.G.R. Nagar","Kamaraj Nagar (North)","Kamaraj Nagar (South)","Thyagaraya Nagar","Rajaji Nagar","Virugambakkam (South)","Saligarmam");
var zone9=new Array("--------Choose--------","Kodambakkam (North)","Kodambakkam (South)","Saidapet","Kumaran Nagar (North)","Kumaran Nagar (South)","Saidapet (West)","Kalaingar Karunanidhi Nagar","V O C Nagar","G D Naidu Nagar (East)","G. D Naidu Nagar (West)","Guindy (West)","Guindy (East)");
var zone10=new Array("--------Choose--------","Beemannapettai","Thiruvalluvar Nagar","Madavaperumal Puram","Karaneeswarpuram","Santhome","Mylapore","Avvai Nagar (South)","Raja Annamalai Puram","Avvai Nagar (South)","Adyar (West)","Adyar (East)","Velachery","Thiruvanmiyur (West)","Thiruvanmiyur (East)");


switch(zone.value)
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
		<div id="navigation">
			<span>Registration of Citizen Account</span>
		</div>
		<div id="content">
		
			<form id="regform" action="CitizenSignUp" method="post"  >
				<h3 style="color:#91bff9;">Instructions: Please fill your account details below and click the 'Submit Complaint' button at the bottom. You will  be given a 'Citizen ID' upon creating an account.</h3>
			
				<div class="text">
					<h2>Account Details</h2>
						<table class="table" width="100%">
						<tr>
						<td>Username:<sup>*</sup></td>
						<td><input type="text" name="username" id="uname" size="30" onchange="check_uname()" maxlength="30" /></td>
						<td>Voter ID:<sup>*</sup></td>
						<td><input type="text" name="verifyId" id="vid" size="30" onchange="check_vid()" maxlength="30" /></td>
						</tr>
						
						<tr>
						<td></td>
					    <td><label class="label" id="unamelabel"></label></td>
					    <td></td>
					    <td><label class="label" id="vidlabel"></label></td>
						</tr>


						<tr>
						<td>Password:<sup>*</sup></td>
						<td><input type="password" name="password" id="pwd" size="30" onchange="check_pwd()" maxlength="30" /> </td>
						<td>Confirm Password:<sup>*</sup></td>
						<td><input type="password" name="cpwd" id="cpwd" size="30" onchange="check_cpwd()" maxlength="30"/> </td>
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
					<td><input type="text" value="Enter as in your voter id.." name="fname" id="fname" size="30" onchange="check_fname()" maxlength="30" /> </td>
					<td>Last Name:<sup>*</sup></td>
					<td><input type="text" name="lname" id="lname" size="30" onchange="check_lname()" maxlength="30" /></td>
					</tr>

					<tr>
					<td></td>
					<td><label class="label" id="fnamelabel"></label></td>
					<td></td>
					<td><label class="label" id="lnamelabel"></label></td>
				    </tr>

              
					<tr>
					<td>Sex:<sup></sup></td>
					<td onclick="check_sex()" width=38px height=50px><input  type="radio" id="male" value="Male" name="radio" class="styled" />Male <input  id="female" type="radio" value="female"name="radio"  class="styled" /><br/><br/> Female</td>
					<td>Age:<sup>*</sup></td>
					<td><input type="text" name="age" onchange="check_age()" id="age" size="30" maxlength="5" /> </td>
					</tr>
					
					<tr>
					<td></td>
					<td><label class="label" id="sexlabel"></label></td>
					<td></td>
					<td><label class="label" id="agelabel"></label></td>
				    </tr>
					
					
					
					<tr>
					<td>Phone:<sup>*</sup></td>
					<td><input type="text" name="phone" id="phone" onchange="check_phone()" size="30" maxlength="10" /> </td>
					<td>Email:<sup>*</sup></td>
					<td><input type="text" name="email" id="email" onchange="check_email()" size="40" maxlength="40" /></td>
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
					<h2>Location Details</h2>
						<table class="table" id="location" width="100%" style="overflow:auto;">
						<tr>

						<td>Zone:<sup>*</sup></td>
						<td>
						<select  style="width:200" id="zone" name="zone" onchange="populate_ward(),check_zone()">
						<option   value ="0" >-- Choose-- </option>
						<option   value ="Zone I Tondiarpet" >Zone I Tondiarpet</option>
						<option   value ="Zone II Basin Bridge" >Zone II Basin Bridge </option>
						<option   value ="Zone III Pulianthope" >Zone III Pulianthope</option>
						<option   value ="Zone IV Ayanavaram" >Zone IV Ayanavaram</option>
						<option   value ="Zone V Kilpauk" >Zone V Kilpauk</option>
						<option   value ="Zone VI Ice House" >Zone VI Ice House</option>
						<option   value ="Zone VII Nungambakkam" >Zone VII Nungambakkam</option>
						<option   value ="Zone VIII Kodambakkam" >Zone VIII Kodambakkam</option>
						<option   value ="Zone IX Saidapet" >Zone IX Saidapet</option>
						<option   value ="Zone X Adyar" >Zone X Adyar</option>
						</select>
						</td>


						<td>Area/Ward:<sup>*</sup></td>
						<td><select style="width:200" id="ward" name="ward" onchange="check_ward()">
						<option   value ="0" >--------Choose--------</option>
						</select></td>
						</tr>


                        		
					<tr>
					<td></td>
					<td><label class="label" id="zonelabel"></label></td>
					<td></td>
					<td><label class="label" id="wardlabel"></label></td>
				    </tr>
						



						<tr>
						<td>Door No:<sup>*</sup></td>
						<td><input type="text" id="door" onchange="check_door()" name="doorno" size="30" maxlength="10"/></td>
						<td>Street:<sup>*</sup></td>
						<td><input type="text" name="street" onchange="check_street()" id="street" size="30" /></td>
						</tr>
						
						
							<tr>
					<td></td>
					<td><label class="label" id="doorlabel"></label></td>
					<td></td>
					<td><label class="label" id="streetlabel"></label></td>
				    </tr>
						
						
						</table>
				</div>
			<input type="submit"  id="register" value="Register"  onclick="return validate()"/>
			<input type="reset"  id="reset" value="Reset" onclick="javascript:reset_fields()"/>
			</form>
			
			<div id="right_column">
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