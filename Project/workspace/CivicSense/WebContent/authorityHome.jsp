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
var invalidate = 0;
var aid;

  


function changestatus(obj)
{
/*if(obj.textContent == "support")
   $(obj).button("option","label","supported");
else
$(obj).button("option","label","support");
*/
invalidate = 0;
xobj = new XMLHttpRequest();
show(0,obj,xobj);
/*
if(invalidate == 1){
xobj.open("GET","AuthorityView?number="+aid+"&type=inavlid",true);
xobj.onreadystatechange = function(){
if(xobj.readyState == 4 && xobj.status == 200)
{
var a = xobj.responseText;//receive invalidated 
$(obj).button("option","label",a);
obj.disalbed = "true";
document.getElementById("compdet").display = "none";
}
};
xobj.send();
}
*/
}
function show(opt,obj,xobj)
{
if(opt == '0')
{
$(function() {
$( "#dialog:ui-dialog" ).dialog( "destroy" );
$( "#dialog-confirm" ).dialog({
resizable: false,
height:140,
modal: true,
buttons: {
"Invalidate Complaint": function() {
$( this ).dialog( "close" );
invalidate = 1;
$(obj).button("option","label","invalidated");
obj.setAttribute("disabled","disabled");
if(invalidate == 1){
xobj.open("GET","AuthorityView?number="+aid+"&type=invalid",true);
xobj.onreadystatechange = function(){
if(xobj.readyState == 4 && xobj.status == 200)
{
var a = xobj.responseText;//receive invalidated 
$(obj).button("option","label",a);
obj.disabled = true;
document.getElementById("cds").style.display = "none";
shownext();
showprev();
}
};
xobj.send();
}
},
Cancel: function() {
$( this ).dialog( "close" );
}
}
});
});
}
else if(opt == '1')
{
$(function() {
$( "#dialog:ui-dialog" ).dialog( "destroy" );
$( "#dialog-confirm1" ).dialog({
resizable: false,
height:140,
modal: true,
buttons: {
"Change Status": function() {
$( this ).dialog( "close" );
invalidate = 1;
var lev;
if(invalidate == 1){
lev = obj.getAttribute("value");
if(lev == "1")
{
document.getElementById("l1").style.backgroundColor = "#99b638";
document.getElementById("l2").style.backgroundColor = "#230730";
document.getElementById("l3").style.backgroundColor = "#230730";
}
else if(lev == "2")
{
document.getElementById("l1").style.backgroundColor = "#230730";
document.getElementById("l2").style.backgroundColor = "#99b638";
document.getElementById("l3").style.backgroundColor = "#230730";
}
else
{
document.getElementById("l1").style.backgroundColor = "#230730";
document.getElementById("l2").style.backgroundColor = "#230730";
document.getElementById("l3").style.backgroundColor = "#99b638";
}
xobj.open("GET","AuthorityView?number="+aid+"&type=change&level="+lev,true);
xobj.onreadystatechange = function(){
if(xobj.readyState == 4 && xobj.status == 200)
{
var a = xobj.responseText;//receive change
}
};
xobj.send();
}
},
Cancel: function() {
$( this ).dialog( "close" );
}
}
});
});
}
}

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
xobj.open("GET","AuthorityView?number="+number+"&type=scroll&nav=next",true);
xobj.onreadystatechange = function(){
if(xobj.readyState == 4 && xobj.status == 200)
{ if(xobj.responseText=='0')
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
xobj.open("GET","AuthorityView?number="+number+"&type=scroll&nav=prev",true);
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
xobj.open("GET","AuthorityView?number="+number+"&type=complaint",true);
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
//var clist = document.getElementById("cdesc");
//var nowclass = clist.childNodes[3];
//a = "street/date,positive,2,in process[a01],health complaint,The best complaint !"
//a = "street/date,null,2,in process[a01],health complaint"
//a = "duraisamy salai/Mar 22 2013,3 -- asdfghjklqwertyqwlk ksjjskkllll,aswin,General -> mosquito menace,1,There are a lot of mosquitoes in our area due to heavy garbage disposalin the open space,level1-buy a mosquito bat,level2-hunt for mosquitoes,level3-mosquitoes killed !!!";
var s = a.split('&');  
/*if(s[1] == "null"){nowclass.childNodes[2].innerHTML = "no feedback given !";}
else
nowclass.childNodes[2].innerHTML = s[1];//feedback_type
*/
if(s[9] == "invalid")
{
$( "#invalidate" ).button({ disabled: true });
document.getElementById("disppur").style.visibility = "hidden";
}
else{
$( "#invalidate" ).button({ disabled: false });
$("#invalidate").button("option","label","Invalidate");
document.getElementById("disppur").style.visibility = "visible";
document.getElementById("stdt").innerHTML = "<span style='font-variant:small-caps;'>Street/Date:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[0];//street/date
document.getElementById("cds").style.display  = "block";
}
document.getElementById("za").innerHTML = "<span style:'font-variant:small-caps;'>Area:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[1];//zone -- area 
document.getElementById("citi").innerHTML = "<span style:'font-variant:small-caps;'>Complaint Posted by:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[2];//citizen name [id]
document.getElementById("subdes").innerHTML = "<span style:'font-variant:small-caps;'>Complaint - Type:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+s[3];// dept -> subtype 
document.getElementById("acd").innerHTML = "<p style='float:left;font-variant:small-caps;font-size:15px;'>Complaint Description:</p><br/><p style='text-align:center;font-size:15px;'>"+s[5]+"</p>";//complaint desc  
document.getElementById("l1").innerHTML = s[6];
document.getElementById("l2").innerHTML = s[7];
document.getElementById("l3").innerHTML = s[8];
document.getElementById("radio1").checked = false;
document.getElementById("radio2").checked = false;
document.getElementById("radio3").checked = false;
if(s[4] == "1")
{
document.getElementById("l1").style.backgroundColor = "#99b638";// s[5] gives the level of complaint process
document.getElementById("l2").style.backgroundColor = "#230730";
document.getElementById("l3").style.backgroundColor = "#230730";
$( "#radio1" ).button({ disabled: true });
//document.getElementById("radio1").disabled = true;
$( "#radio1" ).button( "option", "lr1", "disabled" );
//document.getElementById("lr1").textContent = "disabled";
}
else if(s[4] == "2")
{
document.getElementById("l1").style.backgroundColor = "#230730";
document.getElementById("l2").style.backgroundColor = "#99b638";
document.getElementById("l3").style.backgroundColor = "#230730";
$( "#radio1" ).button({ disabled: true });
$( "#radio2" ).button({ disabled: true });
//document.getElementById("radio1").disabled = true;
//document.getElementById("radio2").disabled = true;
$( "#radio1" ).button( "option", "lr1", "disabled" );
$( "#radio2" ).button( "option", "lr2", "disabled" );
//document.getElementById("lr1").textContent = "disabled";
//document.getElementById("lr2").textContent = "disabled";
}
else if(s[4] == "3")
{
document.getElementById("l1").style.backgroundColor = "#230730";
document.getElementById("l2").style.backgroundColor = "#230730";
document.getElementById("l3").style.backgroundColor = "#99b638";
$( "#radio1" ).button({ disabled: true });
$( "#radio2" ).button({ disabled: true });
$( "#radio3" ).button({ disabled: true });
//document.getElementById("radio1").disabled = true;
//document.getElementById("radio2").disabled = true;
//document.getElementById("radio3").disabled = true;
$( "#radio1" ).button( "option", "lr1", "disabled" );
$( "#radio2" ).button( "option", "lr2", "disabled" );
$( "#radio3" ).button( "option", "lr3", "disabled" );
//document.getElementById("lr1").textContent = "disabled";
//document.getElementById("lr2").textContent = "disabled";
//document.getElementById("lr3").textContent = "disabled";
}
else if(s[4] == "0")
{
document.getElementById("l1").style.backgroundColor = "#230730";
document.getElementById("l2").style.backgroundColor = "#230730";
document.getElementById("l3").style.backgroundColor = "#230730";
$( "#radio1" ).button( "option", "lr1", "Level1" );
$( "#radio2" ).button( "option", "lr2", "Level2" );
$( "#radio3" ).button( "option", "lr3", "Level3" );
$( "#radio1" ).button({ disabled: false });
$( "#radio2" ).button({ disabled: false });
$( "#radio3" ).button({ disabled: false });
//document.getElementById("radio1").disabled = false;
//document.getElementById("radio2").disabled = false;
//document.getElementById("radio3").disabled = false;
}
/*
nowclass.childNodes[4].innerHTML = s[3];//Complaint_status[authority id]
nowclass.childNodes[8].innerHTML = s[4];//Complaint_desc
nowclass.childNodes[12].setAttribute("value",s[5]); //complaint id for setting feedback value 
//document.getElementById("compdesc").display="inline";
var content = "<p style='color:#65b8f9;font-size:16px'>Feedback :</p><br/><p style='font-size:14px;color:#65b250'>" + s[9]+"</p>"; 
if(s[1] != 'null')
{
//nowclass.childNodes[12].innerHTML = content;//feedback string
nowclass.childNodes[12].style.display = "none";
document.getElementById("feed").innerHTML = content;
}
else if(s[6] == "false" && s[1] == 'null')
{
//nowclass.childNodes[12].innerHTML = "<p style='color:#65b8f9;font-size:16px'>Feedback :</p><br/><p style='font-size:14px;color:#65b250'>No feedback posted</p>";
nowclass.childNodes[12].style.display = "none";
document.getElementById("feed").innerHTML = "<p style='color:#65b8f9;font-size:16px'>Feedback :</p><br/><p style='font-size:14px;color:#65b250'>No feedback posted</p>";
}
else if(s[6] == "true" && s[1]=='null')
{
nowclass.childNodes[12].style.display = "inline";
document.getElementById("text").value="";
document.getElementById("feed").innerHTML="";
}
if(s[7]=='disable')
{
$(document.getElementById("support")).button("option","label",s[8]+" supports");
document.getElementById("support").disabled = true;
}
else
{

$(document.getElementById("support")).button("option","label",s[8]+" supports");
document.getElementById("support").disabled = false;
}
//cdesc.appendChild(nowclass);
*/
$(nowclass).fadeIn('slow');
}

function gettree()
{
var clist = document.getElementById("comptile");
var s = "";
var t = "";
var u = "";
var i,j,k;
for(i=0;i < clist.childNodes.length;i = i+1)
{
s += "\n"+i+clist.childNodes[i].getAttribute("class");
for(j = 1;j<clist.childNodes[i].childNodes.length;j = j + 1){
t += "\n"+i+j+clist.childNodes[i].childNodes[j];
if(clist.childNodes[i].childNodes[j].textContent != undefined)t +=clist.childNodes[i].childNodes[j].textContent;
for(k = 1;k < clist./*else
{

returnString.append("<li class='ui-state-default' id=''>"+
"</li>");
}*/childNodes[i].childNodes[j].childNodes.length; k++ )
u += "\n"+i+j+k+clist.childNodes[i].childNodes[j].childNodes[k];
if(clist.childNodes[i].childNodes[j].childNodes[k] != undefined)u +=clist.childNodes[i].childNodes[j].childNodes[k].textContent;
}
alert(t);
}
alert(s);
}

function changelevel(obj)
{
invalidate = 0;
xobj = new XMLHttpRequest();
show(1,obj,xobj);
/*
var lev;
if(invalidate == 1){
lev = obj.getAttribute("value");
alert(lev);
if(lev == "one")
{
document.getElementById("l1").style.backgroundColor = "#99b638";
document.getElementById("l2").style.backgroundColor = "#230730";
document.getElementById("l3").style.backgroundColor = "#230730";
}
else if(lev == "two")
{
document.getElementById("l1").style.backgroundColor = "#230730";
document.getElementById("l2").style.backgroundColor = "#99b638";
document.getElementById("l3").style.backgroundColor = "#230730";
}
else
{
document.getElementById("l1").style.backgroundColor = "#230730";
document.getElementById("l2").style.backgroundColor = "#230730";
document.getElementById("l3").style.backgroundColor = "#99b638";
}
xobj.open("GET","AuthorityView?number="+aid+"&type=change&level="+lev,true);
xobj.onreadystatechange = function(){
if(xobj.readyState == 4 && xobj.status == 200)
{
var a = xobj.responseText;//receive change
}
};
xobj.send();
}
*/
}
$(document).ready(function(){$("#cdesc").toastmessage('showToast', {
    text     : 'Click any scroll<br/>bleow to handle the complaint!<br/>',
    sticky   : false,
    stayTime : 10000,
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

$.fn.tagcloud.defaults = {
 size: {start: 10, end: 20, unit: 'px'},
 color: {start: '#6699ff', end: '#ffffff'}
};

$(function () {
$('#whatever a').tagcloud();
});



</script>
<title>CivicSense|Authority</title>
</head>
<body onload="shownext();">
<%if(request.getAttribute("emailmsg") != null) { %>
<script>
$(document).ready(function(){ $().toastmessage('showToast', {
    text     : "Complaint copy has been <br/> mailed.",
    sticky   : false,
    stayTime : 10000,
    position : top-right,
    type     : 'success'
});});

</script>
<%  request.setAttribute("emailmsg", null);}%>
<%--<body onload="prep('a',document.getElementById('cdesc').childNodes[3])">--%>
<div id="dialog-confirm" title="Confirm Invalidation" style="display:none;">
<p>
<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
Do you confirm to invalidate your complaint ? [ This can't be undone ]
</p>
<br/>
</div>
<div id="dialog-confirm1" title="Confirm Process Change" style="display:none;">
<p>
<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
Do you wish to change the status ?
</p>
<br/>
</div>
<div id="wrapper">
<div id="header">
<p><strong style="color:white;">Welcome</strong>&nbsp;&nbsp;<span style="color:#75A3FF;">${user.fname}&nbsp;&nbsp;[&nbsp;${user.ward }&nbsp;&nbsp;|&nbsp;&nbsp;${user.dept }&nbsp;]</span></p>
&nbsp;&nbsp;<strong style="color:white;">Credits</strong>&nbsp;<span style="color:#75A3FF;">${user.credits}</span>
<ul>
<li class="no_bg"><a href="authorityHome.jsp">Home</a></li>
<li><a href="index.jsp">Sign Out</a></li>
</ul>
</div>
<a href="authorityHome.jsp" id="logo" title="civic sense"></a>
<div id="content">
<div id="left_column">
<div class="scroll">
<h2>Complaint Scroll</h2><br/><br/><br/>
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
<%--
<div class=" text alternative">
<h2>Form groups</h2>
<p><img src="images/group.jpg" alt="group"/>Groups can be formed here
</p>
<a href="#" class="continue">Form a group</a>
</div>
--%>
<div class=" text alternative" id="cdesc">
<h2>Handle the Complaint</h2>
<%-- 
<div class="inside">
<p>street/date</p><p style="float:right;">feedback_type</p>
<p>Complaint status[Authority id]</p>
<br/>
<p style="text-align:center;">complaint_desc</p>
<button style="float:left;" onclick="changestatus(this)">support</button>
<div class="feedback" style="float:right;">
<div class="toggle" style="float:right;">
<input type="radio" value="pos" name="toggle" id="radio2"/><label for="radio1" style="font-size:10px">positive</label>
<input type="radio" value="neg" name="toggle" id="radio1"/><label for="radio2" style="font-size:10px">negative</label>
</div>
  <p>
  Your feedback :
  <textarea rows=4 cols=60></textarea>
  </p>
<button id="post" style="float:right;" onclick="postfeedback(this)">post</button>
</div>
<br/>
</div>
--%>
<%--<div class="inside">
<p>street/date</p><p style="float:right;">feedback_type</p>
<p>Complaint status[Authority id]</p>
<br/>
<p style="text-align:center;">complaint_desc</p>
<button style="float:left;" onclick="changestatus(this)">support</button>
<div class="feedback" style="float:right;">
<div class="toggle" style="float:right;">
<input type="radio" value="pos" name="toggle" id="radio2"/><label for="radio1" style="font-size:10px">positive</label>
<input type="radio" value="neg" name="toggle" id="radio1"/><label for="radio2" style="font-size:10px">negative</label>
</div>
  <p>
  Your feedback :
  <textarea rows=4 cols=60></textarea>
  </p>
<button id="post" style="float:right;" onclick="postfeedback(this)">post</button>
</div>
<br/>
</div>
--%>
<div class="inside" id="disppur" style="visibility:hidden;">
<div style="margin-left:3px;margin-top:3px;font-size:15px">
<p id="stdt" style="font-size:15px;"></p><br/><p id="za" style="font-size:15px;"></p>
<p id="citi" style="font-size:15px;"></p>
<br/>
<p id="subdes" style="font-size:15px;"></p>
<br/>
<br/>
</div>
<br/>
<br/>
<div id="acd" style="overflow:auto;font-size:15px;margin-bottom:10px;"></div>
<div class="compdet" id="cds" style="float:left;max-width:520px;margin-top:10px;">
<div class="toggle" style="float:right;padding:10px;">
<table>
<tr>
<td><span style="font-weight:bold;font-size:18px;float:left;">Toggle Complaint Status</span></td>
<td>
<input type="radio" value="1" name="toggle" id="radio1" onclick="changelevel(this);"/><label id="lr1" for="radio1" style="font-size:18px">Level1</label>
<input type="radio" value="2" name="toggle" id="radio2" onclick="changelevel(this);"/><label id="lr2" for="radio2" style="font-size:18px">Level2</label>
<input type="radio" value="3" name="toggle" id="radio3" onclick="changelevel(this);"/><label id="lr3" for="radio3" style="font-size:18px">Level3</label>
</td>
</tr>
</table>
</div>
 
 
<div id="cpp" style="background-color:#230730;font-weight:bold;overflow:auto;max-height:300px;min-height:150;max-width:500px;min-width:400px;float:left;margin-left:10px;margin-top:10px;">
  <p style="background-color:#000;color:#fff;font-size:18px;">The current processs level of complaint:</p>
  <p id="l1" style="color:#8C4618;font-size:16px;">l1</p>
  <p >&nbsp;</p>
  <p id="l2" style="color:#8C4618;font-size:16px;">l2</p>
  <p>&nbsp;</p>
  <p id="l3" style="color:#8C4618;font-size:16px;">l3</p>
 
  </div>
 
  <button id="invalidate" style="float:left;margin-left:10px;margin-top:10px;font-size:18px;" onclick="changestatus(this)">Invalidate</button>
<%--<button id="post" style="float:right;" onclick="postfeedback(this)">invalidate</button>--%>
</div>
</div>
</div>
</div>
<div id="right_column">

<div id="citizenoptions">
<h3><a href="#">Complaint</a></h3>
<div>
<p><a href="#" style="font-size:14px;color:#65b8f9;">View the complaints to handle</a></p>
</div>
<h3><a href="#">Memo</a></h3>
<div>
<p><span style="font-size:14px;color:#65b8f9;">Memos received:</span></p>
<br/>
<%@ page import="java.util.List" %>
<%String memo=(String)session.getAttribute("memos1");
if(memo.equals("no memos"))
{%>
<br/><span>No Memos</span>
<% }
else{%>
<%@ page import="entity.Memo" %> 
<% @SuppressWarnings("unchecked")
List<Memo> gp1 =(List<Memo>) session.getAttribute("memos")  ;
if(!gp1.isEmpty()) {
for(int j = 0;j < gp1.size(); ++j){ %>
<br/><a href="Memo?value=<%= gp1.get(j).getMemoId() %> "style="text-decoration:none;" ><%= gp1.get(j).getDesc().substring(0, 20) %> ...</a>
<%}}}%>
</div>
<h3><a href="#">Suggestion</a></h3>
<div>
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
if(!gp2.isEmpty() && gp2!=null) {
for(int j = 0;j < gp2.size(); ++j){ %>
<br/><p><a href="SuggestionHandle2?value=<%= gp2.get(j).getSuggestionId() %>" style="text-decoration:none;" ><%=  gp2.get(j).getDesc().substring(0,20) %> ...</a></p>
<% } } } %>
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
                <h2>Authority and Civic Sense</h2>
                </div>
                    <div id="whatever">
  <a href="#" rel="7">Process Levels</a>
  <a href="#" rel="3">Automated memo mail</a>
  <a href="#" rel="10">Complaint Scroll</a>
  <a href="#" rel="5">Memo export as PDF</a>
  <a href="#" rel="6">Credits</a>
  <a href="#" rel="2">Suggestions</a>
</div>
                <div class="heading">
                <h2>Authority can</h2>
                </div>
                <ul>
            <li><span>Handle complaints</span>&nbsp;Using complaint scroll</li>
                        <li><span>Change Process levels</span>&nbsp;to update the status</li>
                        <li><span>Invalidate improper complaints</span>&nbsp;previlege to authority</li>
                        <li><span>View Memos</span>&nbsp;sent by Administrators</li>
                        <li><span>View Suggestions</span>&nbsp;posted by users</li> 
            </ul>
           
</div>
</div>
</div>
<div id="footer">
<div id="footer_content">
<ul>
<li class="no_bg"><a href="authoriityHome.jsp">Home</a></li>
<li><a href="index.jsp">Sign Out</a></li>
</ul>
<p> &copy; 2012 Civic Sense - Team. All wrongs unreserved. </p>
</div>
</div>
</body>
</html>