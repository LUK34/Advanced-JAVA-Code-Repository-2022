<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%--  This is JSP comments: Declaration--%>
<%!
	String username;
	String password;
%>
<!-- This is XML comments: The below code is scriptlet -->
<%
	username=request.getParameter("username");
	password=request.getParameter("password");
	
	if(username.equals("ratan") && password.equals("anu"))
	{
	   out.println("Login Successfull.Welcome "+username);
	}
	else
	{
		out.println("Login Failed.Please try again.");
	}
%>
<%--Print the values: Expression --%>
<%-- 
UserName:<%=username %><br>
Password:<%=password %>
--%>
</body>
</html>