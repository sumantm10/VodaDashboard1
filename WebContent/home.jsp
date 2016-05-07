<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*" %>
	<%@page import="java.sql.ResultSet"%>
    <%@page import="vodadash.Beans" %>
    <%@page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >
    <head>
    	<link rel="stylesheet"  href="css/feedback.css" />
    	
	<script src="js/my_js.js"></script>	
    	<link rel="shortcut icon" href="images/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Welcome to Vodafone STP Dashboard</title>
        <link href="css/layouthome.css" rel="stylesheet" type="text/css" />
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
}
footer a
{

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
                <li><a class="hsubs" href="hsw.jsp">HSW</a>
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
           <!-- Slideshow here -->
 <jsp:include page="slideshow.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
<br><br><br>
  <footer>
<p> <a href="#">contact us</a> | <a href="#">report error</a> | <a href="#">Advertise with us</a></p>
&reg;All rights reserved! <br><br>
</footer>
</div>
  
    </body>
</html>