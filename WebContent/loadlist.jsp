<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*" %>
	<%@page import="java.sql.*"%>
    <%@page import="vodadash.Beans" %>
    <%@page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<%
String nd = request.getParameter("node");
String dt = request.getParameter("date");
String report = request.getParameter("recordtype");
%>

 The details are : Node = <%=nd %> <br> Date = <%= dt %> <br> Report = <%= report %>
</body>
</html>