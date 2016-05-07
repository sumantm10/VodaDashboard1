<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vodafone | DashBoard</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
</head>
<script>
var pass,pass1;
function checkFunction()
{
	pass = document.getElementById("pass").value;
	pass1 = document.getElementById("pass1").value;
	if(pass != pass1)
		{
		alert('Passwords Do not match');
		}
	}
</script>
<style>
body
{
background-image: url("images/wall1.jpg");
background-position: center;
position : relative;
font-size: 18px;
font-style: normal;
font-family: Aller ;
font-weight: bold;
margin-top:35px;
margin-left:30px;
margin-right:40px;

    color: #000000;

}
h1,#head1
{
text-align: center;
border-bottom:0px solid #009;

}
#form1
{
padding: 50px;
font-size: 18px;
font-style: normal;
font-family: sans-serif;
font-weight: bold;
    color: #000000;
}
.bordering
{

border: 10px solid transparent;
    padding: 15px;
    
    
    
    position : relative;
    -webkit-border-image: url(images/border.png) 30 round; /* Safari 3.1-5 */
    -o-border-image: url(images/border.png) 30 round; /* Opera 11-12.1 */
    border-image: url(images/border.png) 30 round;
}
#regisf
{
float:left;
}
#loginf
{
float:right;
margin-right: 60px;
}
#name,#number,#email,#pass,#pass1,#email1,#passw
{
padding: 8px;
font-size:16px;
background-color: #EBE3E3;
background: transparent;
overflow:hidden;
border-width: 1px;
border-color:black;
height:20px;
}
#login,#Register
{
	padding:6px;
	font-size: 14px;
	font-family: Aller;
	color:#C33030;
	font-style: bold;
	position: block;
	background-color: #EBE3E3;
	border-width: 00;
	width: 60%;
	height:30px;
}
#footer
{
position: relative;
  top: 50%;
  transform: translateY(-50%);
  color:#F15858;
}
#footer a
{
color:#2A1212;
text-decoration: none;
}
#forgot
{
font-size: 12px;
font-family: monospace;
color: #BDBDBD;
text-decoration: none;
}
h6
{
font-size: 12px;
font-family: monospace;
color:black;
text-decoration: none;
}
#fgot
{
 background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    
    outline:none;
    font-size: 12px;
font-family: monospace;
color: #BDBDBD;
text-decoration: none;
}
.clear { 
	clear:both; 
}
</style>
<body>



<h1 id="head1"> Vodafone Dashboard </h1>
<div class="bordering" align="center">
<div id="regisf" align="center">
<h2> Vodafone Sign Up </h2>
<form id="form1" action="input" method="post" name="form1">
<input type="text" name="name" autofocus id="name" placeholder="Enter name" required="required" size="40" maxlength="60"> <br> <br><br>
<input type="text" name="number" id="number" placeholder="Mobile Number" required="required" size="40" maxlength="60"> <br> <br><br>
<input type="email" name="email" id="email" placeholder="Valid Email ID" required="required" size="40" maxlength="60"> <br> <br><br>

<input type="password" name="pass" id="pass" placeholder="Enter Password" pattern="(.){6,10}" minlength="6" required="required" size="40" maxlength="60">
<h6>Password should be at least 6 characters long. </h6>

<input type="password" name="pass1" id="pass1" placeholder="Re-Enter password"  required="required" size="40" maxlength="60"><br><br> <br>
<input type="submit" id="Register" value="Register" onmousedown="checkFunction()"> <br><br>
</form>
</div>
<div id="loginf" align="center">
<h2> Already a member</h2>
<br><br><br>
<form id="loginform" action="Login" method="post">
<input type="email" name="email1" id="email1" placeholder="Registered Email ID" required="required" size="40" maxlength="60"> <br> <br><br>
<input type="password" name="passw" id="passw" placeholder="Password" required="required" size="40" maxlength="60"><br><br>
<!-- <input type="submit" id="fgot" value="Forgot You Password?" />  -->
<a id="forgot" href="forgotid.jsp">Forgot your Password?<br></a> <br><br>

<input type="submit" id="login" value="log in" > <br><br>
</form>
</div>
<br><br>
 <br><br>
<br><br>
<br><br>
<br><br>
<br><br><br><br>
<br><br><br><br>
<br><br><br><br>
<br><br><br><br>
<br><br><br><br>
<br><br>
<hr>
<br><br>
<div id="footer">
<p> <a href="#">contact us</a> | <a href="#">report error</a> | <a href="#">Advertise with us</a></p>
</div>
<footer>
&reg;All rights reserved! <br> <br>
</footer>
<div class="clear"></div>
</div>
<div id="foot"></div>
</body>
</html>