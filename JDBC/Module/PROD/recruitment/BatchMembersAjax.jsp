
<%
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ page language="java" session="true"
	import="eclinic.registration.bean.RecruitmentBean"%>

<%
	int i = 0;
%>

<logic:empty name="recruitList">
	<tr>
		<th colspan="6"><div class="nodata">
				<bean:message key="recruitment.list.nodata" />
			</div></th>
	</tr>
</logic:empty>
<logic:present name="recruitList">
	<logic:iterate id="recruit" name="recruitList" type="RecruitmentBean">
		<tr>
			<td><div class="alignCenter"><%=++i%></div></td>
			<td><bean:write name="recruit" property="civil_id" /></td>
			<td><bean:write name="recruit" property="patient_name" /></td>
			<td><bean:write name="recruit" property="mobile_no" /></td>
			<td><bean:write name="recruit" property="dateOfBirth" /></td>
			<td><bean:write name="recruit" property="op_number" /></td>
		</tr>
	</logic:iterate>
</logic:present>
