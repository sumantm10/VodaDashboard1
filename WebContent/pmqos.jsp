<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*" %>
	<%@page import="java.sql.*"%>
    <%@page import="vodadash.Beans" %>
    <%@page import="java.util.Date" %>
    <%@page import="vodadash.DB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"  href="css/feedback.css" />
	<script src="js/my_js.js"></script>	
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  var node_val,chk; 
  function myFunction()
 
  {
	/*  var x = document.getElementById("linkload").selectedIndex;
	  var str = document.getElementsByTagName("option")[x].value;
	 */
	  chk=0;
	  var nodes = document.getElementsByName("node");
	  
	  for(var i = 0; i < nodes.length; i++){
	      if(nodes[i].checked){
	          node_val = nodes[i].value;
	          chk=1;
	      }
	      
	  }
	  var date_val = document.getElementsByName('datepicker')[0].value;
	  
	  //var node = document.getElementById("node").value;
		 
		// document.getElementById("demo").innerHTML = 
			// "The text from the intro paragraph is " + node_val + date_val;
	  //var s = str.toString(); 
	  
		/* if(s == "select")
				 {
				 alert('Please enter a valid report type');				 
				 }*/
				 
		 if(date_val == "")
			 {
			 alert('Please enter a date');
			 }
		 else if(chk == 0)
			 {
			 alert('Please select a node');
			 
			 }
		 
	/* else
		  {
			 var xmlhttp;
			 
			 if (window.XMLHttpRequest)
			   {// code for IE7+, Firefox, Chrome, Opera, Safari
			   xmlhttp=new XMLHttpRequest();
			   }
			 else
			   {// code for IE6, IE5
			   xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			   }
			 xmlhttp.onreadystatechange=function()
			  {
			  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			    document.getElementById("result").innerHTML=xmlhttp.responseText;
			    }
			  }
			 xmlhttp.open("POST","loadlist.jsp?recordtype="+s+"&node="+node_val+"&date="+date_val,"true");
			 //xmlhttp.open("POST","loadlist.jsp?date="+date+"recordtype="+s,"true");
			 //xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			 xmlhttp.send();
		  }
		 */
  	}
  </script>
<link rel="shortcut icon" href="images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Welcome to Vodafone STP Dashboard</title>
      <!-- <link href="css/layout.css" rel="stylesheet" type="text/css" /> -->
     <link href="css/menu.css" rel="stylesheet" type="text/css" />
</head> 
<style>
*{
    margin:0px;
    padding:0px;
}
fieldset
{
padding-left: 30px;
}
#show
{
;z-index: 50;
}
body {
    font:14px/1.3 Arial,sans-serif;
   
    background-color:#FF0000;
	background-image: url("back.jpg");
	background-repeat : repeat-y;
	background-position: top;
	
}
header {
   padding: 10px;
    box-shadow: 0 -1px 2px #111111;
    color:#fff;
    display:block;
    height:60px;
    position:relative;
    width:100%;
    z-index:100;
}

#home
{
font-size:22px;
    font-weight:normal;
    left:50%;
    margin-left:-400px;
    padding:22px 0;
    position:absolute;
    width:540px;
    text-decoration: none;
    color : white;
}

header p.stuts,p.stuts:visited{
    border:none;
    text-decoration:none;
    color:#fcfcfc;
    font-size:14px;
    left:60%;
    line-height:31px;
    margin:23px 0 0 110px;
    position:absolute;
    top:0;
}
header .stuts span {
    font-size:22px;
    font-weight:bold;
    margin-left:5px;
}
#form1
{
border-width: 2px;
padding: 10px;
position: center;
height: 100px;
width: 200px;
padding-left: 300px;
}
#btn
{
padding: 5px;
color: #1E0202;
border: none;
overflow: hidden;
    outline:none;
}
#btn:hover
{
border: none;
overflow: hidden;
    outline:none;
color:#D5D2D2;
background-color: #262626;
}
#result
{
margin-right: 350px;
float:right;
font:14px/1.3 Arial,sans-serif;
font-size: 16px;
color : #400909;
border-width: 2px;
border-color: #000000;
padding: 5px;
}
#result a
{
font-size: 16px;
color : #2D2B2B;
}
#result a,#show a
{
text-decoration: none;
}

#end
{

text-align: center;
  
  color:#2C2626;
  margin-top: 25%;
}
#end a
{

text-align: center;
  
  color:#2C2626;
}
#container {
   height: 80px;
    margin: 30px 50px 20px 260px;
    width: 415px;
}
h5 a
{
text-decoration: none;
float:right;
color:#FF1F1F;
margin-right: 380px;
margin-top: 40px;
}
#linkload,#datepicker
{
border: none;
overflow: hidden;
    outline:none;
    width:220px;
    background-color: #9A9A9A;
    padding: 5px;
}
</style>
<body>
	<script>
	{
		var svar = '<%=session.getAttribute("name")%>';
		if(svar.localeCompare("null")==0)
			{
		alert('Please log in to access the dashboard.');
		location.href='Index.jsp';
			}
	}
	</script>
	<header>
            <h2><a id="home" href="home.jsp">Welcome to Vodafone Delhi STP Dashboard </a></h2>
            <p class="stuts">Welcome <span><%=session.getAttribute("name") %></span></p>
            <h5> <a href="logout.jsp">Logout</a></h5>
	</header>
	
	
	<!-- Feedback pop up -->
	
	<div id="abc">
 
	 <!-- Popup div starts here -->
 <div id="popupContact"> 

	<!-- feedback form -->
		<form action="feedbackmail" method="get">
			<img src="images/3.png" id="close" onclick ="div_hide()" />
			<h2>Feedback!!</h2> <hr/>
			<input type="text" name="namef" id="namef" placeholder="Name"/> <br>
			
			<input type="email" name="emailf" id="emailf" placeholder="Email"/> <br><br>
			
			<textarea name="messagef" placeholder="Message" id="msgf" rows="5" cols="33"></textarea>
			<br><br>
			<input type="submit" onmousedown="check_empty()" value="send" id="fdbtn" />
			<!-- <a id="submit" href="javascript: check_empty()">Send</a> -->
			<br><br>
			
		</form>
 </div> 
 <!-- Popup div ends here -->
 </div>
	
	<div id="container">

            <ul id="nav">
                <li><a href="home.jsp">Home</a></li>
                <li><a class="hsubs" href="#">Database</a>
                <div class="menu_container">
                    <ul class="subs">
                        <li><a href="mpdetails.jsp">MP Details</a></li>
                        <li><a href="tracker.jsp">Tracker</a></li>
                        <li><a href="licsheet.jsp">LIC Sheet</a></li>
                        <li><a href="routerports.jsp">Router Ports</a></li>
                        <li><a href="otherdbs.jsp">Other Databases</a></li>
                    </ul>
                    </div>
                </li>
                <li><a class="hsubs" href="#">Reports</a>
                <div class="menu_container">
                    <ul class="subs">
                        <li><a href="linkload.jsp">Link Load Reports</a></li>
                        <li><a href="mpreports.jsp">MP Reports</a></li>
                        <li><a href="pmqos.jsp">PMQOS Reports</a></li>
                        <li><a href="routerutil.jsp">Router Utilization</a></li>
                        
                    </ul>
                    </div>
                </li>
                <li><a class="hsubs" href="hsw.jsp">HSW</a>
                </li>
                
                <li><a href="#" onclick="div_show()">Feedback</a></li>
                         

        </div>
             <div id="result">
        
      <%! int i,t; %>  
	<%
	
		String report="PMQOS";
		
		String node=request.getParameter("node");
		System.out.println(node);
		String date=request.getParameter("datepicker");
		System.out.println(date);
		Beans.connect();
		try {
			i=1;
			t=1;
		Beans.connect();
		String query = " select filename from `reports` where reporttype like '"+report+"' and node like '"+node+"' and date like '"+date+"'";
		// String query = "select * from files where `Sr.No` = '1'";
		Beans.dataRet(query);
		ResultSet data = Beans.getRs();		
		if(data.next())
		{
			%>
			<h3> The Required database : </h3> <br>
			<%
			data.previous();
		while(data.next())
		{ %>
		
		<p> <%=t++ +". " %> &nbsp;&nbsp;
		<% request.setAttribute("name", data.getString(i)); %>
		<a href="reportdownload?param=<%= data.getString(i) %>"> <%= data.getString(i) %>  </a> </p>
	
	<%
	}
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
	</div> 
            
            
            
            
            
            
            <div id="show">
	<form id="form1" action="pmqos.jsp" method="get">
	<h2>PMQOS Reports Details</h2> <br><br>
	<!-- <fieldset>
	<legend align="top" > LIC Sheet </legend> <br>
	<input type="radio" name="licsheet" id="licsheet" value="CR Tracker"> CR Tracker <br><br>
	<input type="radio" name="licsheet" id = "licsheet" value="NSN Ticket Tracker"> NSN Ticket Tracker <br><br>
	</fieldset> <br><br>

	<h4>Select Link Load type </h4> <br>
	<select id="linkload" name="linkload">
	<option value="select"> --select-- </option>
	<option value="ATM"> ATM </option>
	<option value="HSL"> HSL </option>
	<option value="LSL"> LSL </option>
	<option value="M3UA"> M3UA </option>
	<option value="M2PA"> M2PA </option>
	</select> <br><br>
	<br> -->
	<fieldset>
	
	<legend> NODE </legend> <br>
	<input type="radio" name="node" id="node" value="Delhi Regional"> Delhi Regional <br><br>
	<input type="radio" name="node" id = "node" value="Delhi National"> Delhi National <br><br>
	</fieldset>
	<br><br>
	<h4>Choose Date : </h4>
	<input type="text" id="datepicker" name="datepicker" placeholder="MM/DD/YYYY"/>
	<br><br>
	<input id="btn" type="submit" onmousedown="myFunction()" value="Continue">
	
	</form>
	</div>
<!--  <form action="linkload.jsp" method="get">
<input type="text" id="datepicker" name="datepicker" />
<input type="submit" value="show">
</form> -->


<div id="end">
<footer>
<p> <a href="#">contact us</a> | <a href="#">report error</a> | <a href="#">Advertise with us</a></p>
&reg;All rights reserved! <br><br>
</footer>
</div>
</body>
</html>