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
<title>Civic Sense|Sign Up</title>

<style type="text/css">
sup,.label{color:red;}
.table{background-color:lightblue;}
#addr,#desc{resize:none;}
</style>



<script>
$(function() {
	$( "input:submit").button();
	$( "input:reset").button();
});
</script>


<script type="text/javascript">

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


function check_name()
{
ajax_call();
var name=document.getElementById("name");
var namelabel=document.getElementById("namelabel");
var pattern=/^[0-9a-zA-Z ]+$/;
if(name.value=="")
namelabel.innerHTML="cannot be empty";
else if(!name.value.match(pattern))
namelabel.innerHTML="can contain only alphabets and numbers";
else
namelabel.innerHTML="";
}


function check_motto()
{
var motto=document.getElementById("motto");
var mottolabel=document.getElementById("mottolabel");
var pattern=/^[0-9a-zA-Z ]+$/;
if(motto.value=="")
mottolabel.innerHTML="cannot be empty";
else if(!motto.value.match(pattern))
mottolabel.innerHTML="can contain only alphabets and numbers";
else
mottolabel.innerHTML="";
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
selectbox.options .add(opt);
}
}


function check_desc()
{
var desc=document.getElementById("desc");
var desclabel=document.getElementById("desclabel");
var pattern=/^[0-9a-zA-Z \n.,-]+$/;
if(desc.value=="")
desclabel.innerHTML="cannot be empty";
else if(!desc.value.match(pattern))
desclabel.innerHTML="cannot contain special characters other than ,.-";
else if(desc.value.length>300)
	desclabel.innerHTML="cannot exceed more than 300 characters";
else
desclabel.innerHTML="";
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

function check_addr()
{
var addr=document.getElementById("addr");
var addrlabel=document.getElementById("addrlabel");
var pattern=/^[ \na-zA-Z0-9.,-/]+$/;
if(addr.value=="")
 addrlabel.innerHTML="cannot be empty";
else if(!addr.value.match(pattern))
 addrlabel.innerHTML="cannot contains special characters other than ,.-/";
else
addrlabel.innerHTML="";
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



function ajax_call()
{
	var uname=document.getElementById("uname").value;
	var vid=document.getElementById("vid").value;
	var zone=document.getElementById("zone").value;
	var ward=document.getElementById("ward").value;
	var name=document.getElementById("name").value;
	var unamelabel=document.getElementById("unamelabel");
	var vidlabel=document.getElementById("vidlabel");
	
if(uname!="" && vid!="" && zone!="0" && ward!="0" && name!="")
{
var xhr=new XMLHttpRequest();//creating a new XMLHttpReuest
	xhr.open("GET","AJAX?uname="+uname+"&vid="+vid+"&name="+name+"&zone="+zone+"&ward="+ward+"&type=ngosignup",true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200)
		{
			result=xhr.responseText;
		 	switch(result)
		 	{
		 	case "-1":unamelabel.innerHTML="username already exists";
		 			break;
		 	case "0":vidlabel.innerHTML="input details not matching with ur NGO verification id details";
		 			break;
		 	case "1":vidlabel.innerHTML="";
		 			unamelabel.innerHTML="";
		 			break;
		 	}
		}};
		xhr.send();
}
}

function validate()
{
var labels=document.getElementsByClassName("label");

check_uname();check_pwd();check_name();check_motto();check_desc();
check_phone();check_email();check_cpwd();check_addr();check_vid();check_zone();
check_ward();

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
document.getElementById("vid").value="";
document.getElementById("name").value="";
document.getElementById("motto").value="";
document.getElementById("pwd").value="";
document.getElementById("cpwd").value="";
document.getElementById("phone").value="";
document.getElementById("email").value="";
document.getElementById("addr").value="";
document.getElementById("desc").value="";
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
			<span>Registration of Non-Governmental Organization</span>
		</div>
		<div id="content">
			<form id="regform" action="NgoSignUp" method="post">
			<h3 style="color:#91bff9;">Instructions: Please fill your account details below and click the 'Register' button at the bottom.</h3>
			<h3 style="color:#91bff9;">(<sup>*</sup>indicates required fields)</h3>
			<hr/>
					<div class="text">
					<h2>Account Details</h2>
					<table class="table" width="100%">

					<tr>
					<td>Username:<sup>*</sup></td>
					<td><input type="text" name="username" id="uname" size="30" maxlength="30" onchange="check_uname()"/></td>
					<td>Verification ID:<sup>*</sup></td>
					<td><input type="text" name="verifyId" id="vid" size="30" maxlength="30" onchange="check_vid()"/></td>
					</tr>

                      <tr>
					<td></td>
					<td><label class="label" id="unamelabel"></label></td>
					<td></td>
					<td><label class="label" id="vidlabel"></label></td>
				    </tr>
				    
				    
					<tr>
					<td>Password:<sup>*</sup></td>
					<td><input type="password" name="password" id="pwd" size="30" maxlength="30" onchange="check_pwd()"/> </td>
					<td>Confirm Password:<sup>*</sup></td>
					<td><input type="password" name="confirmPassword" id="cpwd" size="30" maxlength="30" onchange="check_cpwd()"/> </td>
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
					<h2>Organization Details</h2>
					<table class="table" width="100%" style="overflow:auto;">
					<tr>
					<td>Name of the Organization:<sup>*</sup></td>
					<td><input type="text" value="Enter as in your NGO ID.." name="name" id="name" size="50" maxlength="30" onchange="check_name()"/> </td>
					
					
					<td>Motto:<sup>*</sup></td>
					<td><input type="text" name="motto" id="motto" size="50" maxlength="50" onchange="check_motto()" /></td>
					</tr>
					
					 <tr>
					<td></td>
					<td><label class="label" id="namelabel"></label></td>
					<td></td>
					<td><label class="label" id="mottolabel"></label></td>
				    </tr>
				    
				    
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
					<td>NGO Description:<sup>*</sup></td>
					<td><textarea name="desc" id="desc" rows="4" cols="22" onchange="check_desc()"></textarea></td>
					
					<td>Office Address:<sup>*</sup></td>
					<td><textarea name="offaddr" id="addr" rows="4" cols="22" onchange="check_addr()"></textarea></td>
					</tr>
					
					
				    <tr>
					<td></td>
					<td><label class="label" id="desclabel"></label></td>
					<td></td>
					<td><label class="label" id="addrlabel"></label></td>
				    </tr>
					
					


					<tr>
					<td>Phone:<sup>*</sup></td>
					<td><input type="text" name="phone" id="phone" size="50" onchange="check_phone()" maxlength="10" /> </td>
					
					<td>Email:<sup>*</sup></td>
					<td><input type="text" name="email" id="email" size="50" onchange="check_email()" maxlength="40" /></td>
					</tr>
					
					<tr>
					<td></td>
					<td><label class="label" id="phonelabel"></label></td>
					<td></td>
					<td><label class="label" id="emaillabel"></label></td>
				    </tr>
					
					
					</table>
				    </div>
					<input type="submit"  id="register" value="Register" onclick="return validate()"/>
					<input type="reset"   id="reset" value="Reset" onclick="javascript:reset_fields()"/>
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