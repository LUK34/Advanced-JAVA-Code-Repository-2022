<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Second JSP Page</title>
</head>
<body>

<%!
	String initparam1, initparam2;
	String contextparam1,contextparam2;
%>

<%
	initparam1=config.getInitParameter("vsc1");
	initparam2=config.getInitParameter("vsc2");
	
	contextparam1=application.getInitParameter("username");
	contextparam2=application.getInitParameter("password");
%>

Init param-1 <%=initparam1%><br>
Init param-2 <%=initparam2%>
<br><br><br>
Context param-1 <%=contextparam1%><br>
Context param-2 <%=contextparam2%>


</body>
</html>