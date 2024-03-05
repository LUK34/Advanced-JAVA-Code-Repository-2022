<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Jsp Page</title>
</head>
<body>
<%
	out.println("This is working with Page Context Object.");
	String uname = request.getParameter("uname");
	pageContext.setAttribute("uname",uname, PageContext.APPLICATION_SCOPE);
	out.println("<a href='second.jsp'>Click here to get message</a>");
%>
</body>
</html>