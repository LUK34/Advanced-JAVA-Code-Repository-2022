<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<jsp:declaration> 
	Date date= null;
</jsp:declaration>

<jsp:scriptlet>
	date=new Date();
</jsp:scriptlet>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hi JSP Page</title>
</head>
<body bgcolor="lightyellow">
<center>
	<b>
		<font size="6" color="red"><br><br>
		Today Date: <jsp:expression>date</jsp:expression>>
		</font>
	</b>
</center>
</body>
</html>