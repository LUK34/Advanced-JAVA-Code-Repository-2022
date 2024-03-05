<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello JSP Page</title>
</head>
<body>

<jsp:plugin code="AppletDemo" codebase="AppletDemo" width="200" height="200" type="applet">
	<jsp:params>
		<jsp:param name="message1" value="ratan software solutions"/>
		<jsp:param name="message2" value="naresh spftware solutions"/>
	</jsp:params>
	<jsp:fallback>
		<p>Unable to load applet</p>
	</jsp:fallback>
	
</jsp:plugin>


</body>
</html>