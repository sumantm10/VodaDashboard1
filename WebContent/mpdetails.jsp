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
<link rel="shortcut icon" href="images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Welcome to Vodafone STP Dashboard</title>
      <!-- <link href="css/layout.css" rel="stylesheet" type="text/css" /> -->
     <link href="css/menu.css" rel="stylesheet" type="text/css" />
     <script>
     var node_val,chknode,mp_value,chkmp; 
     function myFunction()
     
     {
   	/*  var x = document.getElementById("linkload").selectedIndex;
   	  var str = document.getElementsByTagName("option")[x].value;
   	 */
   	  chknode=0,chkmp=0;
   	  var nodes = document.getElementsByName("node");
   	  var mptype = document.getElementsByName("mpgroup");
   	  for(var i = 0; i < nodes.length; i++){
   	      if(nodes[i].checked){
   	          node_val = nodes[i].value;
   	          chknode=1;
   	      }
   	      
   	  }
   	for(var j = 0; j < mptype.length; j++){
 	      if(mptype[j].checked){
 	          mp_value = mptype[j].value;
 	          chkmp=1;
 	      }
 	      
 	  }
   	 if(chknode == 0)
	 {
	 alert('Please select a node');
	 
	 }
   	 else if(chkmp == 0)
   		 {
   		 alert('Please select a valid type');
   		 }
   		 }
 </script>
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
z-index: 50;
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
	
		String mp=request.getParameter("mpgroup");
		System.out.println(mp);
		String node=request.getParameter("node");
		System.out.println(node);
		DB db = new DB();
		Connection conn=db.dbConnect("jdbc:mysql://127.0.0.1/test","root","1234");
		try {
			i=1;
			t=1;
		Beans.connect();
		String query = " select filename from `database` where databasetype like '"+mp+"' and node like '"+node+"'";
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
		<a href="filedownload?param=<%= data.getString(i) %>"> <%= data.getString(i) %>  </a> </p>
	
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
	<form id="form1" action="mpdetails.jsp" method="get">
	<h2>MP details</h2> <br>
	<fieldset>
	<legend align="top" > MP : TYPE </legend> <br>
	<input type="radio" name="mpgroup" id="mpgroup" value="MP : IP"> MP : IP <br><br>
	<input type="radio" name="mpgroup" id = "mpgroup" value="MP : MTP"> MP : MTP <br><br>
	</fieldset> <br><br>
	<fieldset>
	<legend> NODE </legend> <br>
	<input type="radio" name="node" id="node" value="Delhi Regional"> Delhi Regional <br><br>
	<input type="radio" name="node" id = "node" value="Delhi National"> Delhi National <br><br>
	</fieldset>
	<br><br>
	<input id="btn" type="submit" onmousedown="myFunction()" value="Continue">
	
	</form>
	</div>
	
<div id="end">
<footer>
<p> <a href="#">contact us</a> | <a href="#">report error</a> | <a href="#">Advertise with us</a></p>
&reg;All rights reserved! <br><br>
</footer>
</div>
</body>
</html>