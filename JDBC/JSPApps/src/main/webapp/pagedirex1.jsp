<%@ page language="java" contentType="text/html;" pageEncoding="ISO-8859-1" import="java.util.Date" errorPage="myerror.jsp"
autoFlush="true" isThreadSafe="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Date print</title>
</head>
<body>
<%! Date d=null; %>
<%--
 <% d=new Date();%>
Today Date: <%=d%>
--%>
Today Date: <%=d.toString()%>
</body>
</html>