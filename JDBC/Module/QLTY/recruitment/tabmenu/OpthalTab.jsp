<%     
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<input type="hidden" id="serial_id" name="serial_id" value="<bean:write name="opthal" property="serial_id" />" />
<table class="fheading33">
	<tr>
		<th colspan="6" background="/eclinic/images/shade.gif"><strong>&nbsp;<bean:message key="recruitment.opthal.heading" /></strong></th>
	</tr>
	<tr>
		<th width="10%">&nbsp;<bean:message key="recruitment.opthal.lt" /></th>
		<td><input class="text1" type="text" id="lt" name="lt" value="<bean:write name="opthal" property="lt" />"
			onblur="updateOpthalDetails()" /></td>
		<th width="10%">&nbsp;<bean:message key="recruitment.opthal.rt" /></th>
		<td><input class="text1" type="text" id="rt" name="rt" value="<bean:write name="opthal" property="rt" />"
			onblur="updateOpthalDetails()" /></td>
		<th width="10%">&nbsp;<bean:message key="recruitment.opthal.oph" /></th>
		<td><input class="text1" type="text" id="oph" name="oph" value="<bean:write name="opthal" property="oph" />"
			onblur="updateOpthalDetails()" /></td>
	</tr>
</table>
<jsp:include page="/eclinic_jsp/recruitment/tabmenu/MedicalStatusTab.jsp" />