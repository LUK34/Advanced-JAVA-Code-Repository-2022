<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
 String uname=(String)pageContext.getAttribute("uname",PageContext.APPLICATION_SCOPE);
 out.println("Welcome "+uname+" "+new Date());
%>
</body>
</html>