<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>First JSP Page</title>
</head>
<body>
<%!
  String uname;
  int uage;
%>

<%
	uname=request.getParameter("uname");
	uage=Integer.parseInt(request.getParameter("uage"));
	
	session.setAttribute("uname",uname);
	session.setAttribute("uage",uage);
%>
<jsp:forward page="form2.html"/>

</body>
</html>