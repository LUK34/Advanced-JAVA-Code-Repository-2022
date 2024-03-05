<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main JSP Page</title>
</head>
<body>
<%!
	int eid;
	String ename;
	double esal;
%>

<%
	eid= Integer.parseInt(request.getParameter("eid"));
	ename=request.getParameter("ename");
	esal=Double.parseDouble(request.getParameter("esal"));
%>

<!-- Configure the bean class -->
<jsp:useBean id="eb" class="com.tcs.EmpBean" scope="application"/>

<!-- set the data to bean class object using setter methods -->
<jsp:setProperty property="eid" name="eb" value="<%=eid%>"/>
<jsp:setProperty property="ename" name="eb" value="<%=ename%>"/>
<jsp:setProperty property="esal" name="eb" value="<%=esal%>"/>

<!-- get the data from bean class using getter methods -->
Emp ID:<jsp:getProperty property="eid" name="eb"/><br><br>
Emp Name:<jsp:getProperty property="ename" name="eb"/><br><br>
Emp Sal:<jsp:getProperty property="esal" name="eb"/><br><br>


</body>
</html>