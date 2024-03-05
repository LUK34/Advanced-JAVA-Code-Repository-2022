<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display JSP Page</title>
</head>
<body bgcolor="pink">
<%!
	Connection conn;
	PreparedStatement ps;
%>
<%-- 192.168.1.101--%>
<%

	Class.forName("oracle.jdbc.driver.OracleDriver");		
	conn= DriverManager.getConnection("jdbc:oracle:thin:@192.168.220.67:1521:ORCL","system","mathew");
	ps=conn.prepareStatement("Insert into user_details values(?,?,?,?,?,?)");
	ps.setString(1,(String)session.getAttribute("uname"));
	ps.setInt(2,(Integer)session.getAttribute("uage"));
	ps.setString(3,(String)session.getAttribute("uqual"));
	ps.setString(4,(String)session.getAttribute("udesig"));
	ps.setString(5,request.getParameter("email"));
	ps.setString(6,request.getParameter("mobile"));
	ps.executeUpdate();
	out.println("<center>Data inserted Successfully.<center>");
%>
</body>
</html>