<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload files</title>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
</head>
<body>
	<center>
		
	
	
	<form action ="uploadServlet" method="post" enctype="multipart/form-data">
<h3>For Database</h3>
<input type="hidden" name="upload" value="database"/>
 Select Database Type &nbsp;&nbsp; : &nbsp;&nbsp; 
 <select id="databasetype" name="databasetype">
    <option value="MP : IP">MP : IP</option>
    <option value="MP : MTP">MP : MTP</option>
    <option value="CR Tracker">CR Tracker</option>
   <option value="NSN Ticket Tracker">NSN Ticket Tracker</option>
  <option value="LIC Sheet">LIC Sheet</option>
  <option value="Router Ports">Router Ports</option>
  <option value="Node GTs">Node GTs</option>
  <option value="SCR Servers">SCR Servers</option>
 <option value="DXC Sheet">DXC Sheet</option>
  <option value="Spare Inventory">Spare Inventory</option>
  </select>
  <br><br>
 Select Node &nbsp;&nbsp; : &nbsp;&nbsp; 
  <select id="node" name="node">
  <option value="Delhi Regional">Delhi Regional</option>
  <option value="Delhi National">Delhi National</option>
  <option value="Common">Common</option>
  </select> <br><br>
  Select files: <input type="file" name="files"> <br><br>
  
  <input type="submit">
<BR><BR><BR><HR><HR>
</form>



<form action="uploadServlet" method="post" enctype="multipart/form-data" >
<h3>For Reports : </h3>
<input type="hidden" name="upload" value="reports"/>
 Select Report Type &nbsp;&nbsp; : &nbsp;&nbsp; 
 <select id="reporttype" name="reporttype">
    <option value="ATM">ATM</option>
    <option value="HSL">HSL</option>
    <option value="LSL">LSL</option>
   <option value="M3UA">M3UA</option>
  <option value="M2PA">M2PA</option>
  <option value="MP Reports">MP Reports</option>
  <option value="PMQOS">PMQOS</option>
  <option value="Router Utilization">Router Utilization</option>
  </select>
  <br><br>
 Select Node &nbsp;&nbsp; : &nbsp;&nbsp; 
  <select id="node" name="node">
  <option value="Delhi Regional">Delhi Regional</option>
  <option value="Delhi National">Delhi National</option>
  <option value="Common">Common</option>
  </select> <br><br>
   Select Router &nbsp;&nbsp; : &nbsp;&nbsp; 
  <select id="router" name="router">
  <option value="Peera Garhi">Peera Garhi</option>
  <option value="Gurgaon">Gurgaon</option>
  <option value="Common">Common</option>
  </select> <br><br>
  Choose Date &nbsp;&nbsp;:&nbsp;&nbsp; 
	<input type="text" id="datepicker" name="datepicker" placeholder="MM/DD/YYYY"/>
	<br><br>
	 Select files: <input type="file" name="files" id = "files"> <br><br>
  <input type="submit">
</form>
</center>
</body>
</html>