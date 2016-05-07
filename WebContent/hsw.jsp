<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*" %>
	<%@page import="java.sql.ResultSet"%>
    <%@page import="vodadash.Beans" %>
    <%@page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"  href="css/feedback.css" />
    	
	<script src="js/my_js.js"></script>	
    	<link rel="shortcut icon" href="images/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Health Safety and Welfare</title>
        <link href="css/layouthsw.css" rel="stylesheet" type="text/css" />
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
</head>
<style>
*{
    margin:0px;
    padding:0px;
}
	footer
{
margin-bottom: 10px;
text-align: center;
  color:#2C2626;
  font-size: 18px;
font-style: normal;
font-family: Aller ;
font-weight: bold;
margin-top:35px;
margin-left:30px;
margin-right:40px;

    color: #000000;
}
footer a
{
margin-bottom: 10px;
text-align: center;
  color:#2C2626;
  font-size: 18px;
font-style: normal;
font-family: Aller ;
font-weight: bold;
margin-top:35px;
margin-left:30px;
margin-right:40px;
text-align: center;
  
  color:#2C2626;
}
#home
{
text-decoration: none;
color:#FFFFFF;
}

h5 a
{
text-decoration: none;
float:right;
color:#FF1F1F;
margin-right: 380px;
margin-top: 40px;
}
.hswimg
{
margin-left: 250px;
}
.hswimg img
{
height: 300px;
width: 300px;
z-index: -25;
}
.hswimg a
{
font-size:20px;
text-decoration: none;
float:right;
color: #03EEF2;
margin-right: 400px;
}
.hswimg,.hswimg img:hover
{
height: 80%;
width: 80%;
z-index: 500;
-webkit-transition: 0.5s; 
transition:0.5s;
}

#footer p a
{
font-size: 18px;
font-style: normal;
font-family: Aller ;
font-weight: bold;
color:#2A1212;
text-decoration: none;
}
.clear { 
	clear:both; 
}
#topic
{
text-align: left;
font-family: 'Vodafone Rg';
font-weight: bold;
color: #24EBEE;
font-size: 26pt;
margin-left: 450px;
width: 445px;
}
.hswimg a:hover
{
    transform:scaleX(1.1);
transition : 0.5s;
color : #003641;
}
#topic:hover
{
  transform:scaleX(1.1);
transition : 0.5s;
color : #003641;

}
</style>
<script>
function myFunction2(id)
{
	document.getElementById(id).style.transition = "0.5s";
	document.getElementById(id).style.WebkitTransition = "0.5s";
	}
</script>
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
<div id="head">
<header>
            <h2><a id="home" href="home.jsp">Welcome to Vodafone Delhi STP Dashboard </a></h2>
            <p class="stuts">Welcome <span><%=session.getAttribute("name") %></span></p>
            <h5> <a href="logout.jsp">Logout</a></h5>
	</header>
	</div>
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
	
	
	
	
       <div class="container">
            <ul id="nav">
                <li><a href="home.jsp">Home</a></li>
                <li><a class="hsubs" href="#">Database</a>
                    <ul class="subs">
                        <li><a href="mpdetails.jsp">MP Details</a></li>
                        <li><a href="tracker.jsp">Tracker</a></li>
                        <li><a href="licsheet.jsp">LIC Sheet</a></li>
                        <li><a href="routerports.jsp">Router Ports</a></li>
                        <li><a href="otherdbs.jsp">Other Databases</a></li>
                        
                    </ul>
                </li>
                <li><a class="hsubs" href="#">Reports</a>
                    <ul class="subs">
                        <li><a href="linkload.jsp">Link Load Reports</a></li>
                        <li><a href="mpreports.jsp">MP Reports</a></li>
                        <li><a href="pmqos.jsp">PMQOS Reports</a></li>
                        <li><a href="routerutil.jsp">Router Utilization</a></li>
                        
                    </ul>
                </li>
                <li><a class="hsubs" href="#">HSW</a>
                </li>
                
                <li><a href="#" onclick="div_show()">Feedback</a></li>
                <!-- 
                                <li><a href="#">Menu 5</a></li>
                <li><a href="#">Menu 6</a></li>
                <li><a href="http://www.script-tutorials.com/pure-css3-lavalamp-menu/">Back</a></li>
                <div id="lavalamp"></div>
            </ul>
            -->
            </ul>
            </div>
            
       <h2 id="topic" onmouseout="myFunction2('topic')"> Health Safety and Wellbeing </h2>     
         <br><br>   
        	<div id = "hsw" class="hswimg">
        	<img id="hsw1" alt="HSW Rules" src="images/hswrules.png"  onmouseout="myFunction2('hsw1')"> &nbsp; &nbsp;
        	<a id="a1" href="files/CMM_Chart_Only_Violations.pdf" onmouseout="myFunction2('a1')">HSW Chart</a> <br><br>
        	</div>
        	<div class="hswimg">
        	<img id="hswcmm" alt="HSW CMM" src="images/hsw.png" onmouseout="myFunction2('hswcmm')"> &nbsp;&nbsp;
        	<a id="a2" href="files/CMM_Chart_for_all.pdf" onmouseout="myFunction2('a2')">HSW CMM</a> <br><br>
        	</div>
        	<div class="hswimg">
        	<img id="hswletter" alt="HSW Letler" src="images/hswletter.jpg" onmouseout="myFunction2('hswletter')"> &nbsp; &nbsp;
        	
        	
        	<a id="a3" href="files/Latest_HSW_Policy.pdf" onmouseout="myFunction2('a3')">HSW Policy</a><br><br>
        	<br><br>
        	
        	</div>
        	
        	<center><hr width="800px" color="#02E0E4" size="1px"></center>
<br><br>
        	<center>
        	
        	<div id="footer">
<p> <a href="#">contact us</a> | <a href="#">report error</a> | <a href="#">Advertise with us</a></p>
</div>

<footer>
&reg;All rights reserved! <br> <br>
</footer>
<div class="clear"></div>
</div>
</center>
<div id="foot"></div>
            
</body>
</html>