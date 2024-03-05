
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="recruitment.title" /></title>
<style type="text/css">
.nodata {
	text-align: center;
	color: black;
}

.alignCenter {
	text-align: center;
}
</style>
<script type="text/javascript"
	src="/eclinic/eclinic_jsp/js/recruitment/common.js"></script>
<script type="text/javascript"
	src="/eclinic/eclinic_jsp/js/recruitment/recruitmentList.js"></script>
</head>
<body>
	<div class="main-body-container">
	<form id="recruitmentForm">
		<input type="hidden" id="method" name="method" />
		<%
			int i = 0;
		%>
		<table class="fheading33" id="recruitList">
			<tr>
				<th colspan="7" background="/eclinic/images/shade.gif"><strong>&nbsp;<bean:message
							key="recruitment.batch.members" /></strong></th>
			</tr>
			<tr>
				<th width="5%" rowspan="2"><strong>&nbsp;<bean:message
							key="global.header.slNo" /></strong></th>
				<th width="10%"><strong>&nbsp;<bean:message
							key="recruitment.batch.number" /></strong></th>
				<th width="15%"><strong>&nbsp;<bean:message
							key="global.common.civilId" /></strong></th>
				<th><strong>&nbsp;<bean:message key="global.reg.name" /></strong></th>
				<th width="15%" rowspan="2"><strong>&nbsp;<bean:message
							key="global.revisit.mobileno" /></strong></th>
				<th width="15%" rowspan="2"><strong>&nbsp;<bean:message
							key="global.reg.dateOfBirth" /></strong></th>
				<th width="15%" rowspan="2"><strong>&nbsp;<bean:message
							key="global.reg.regNumber" /></strong></th>
			</tr>
			<tr>
				<th>&nbsp;<input class="text1" type="text" id="batch_no" name="batch_no" size="10"
					onkeyup="if(event.which == '13') { fetchRecruitListByCriteria(); }" /></th>
				<th>&nbsp;<input class="text1" type="text" id="civil_id" name="civil_id" size="15"
					onkeyup="if(event.which == '13') { fetchRecruitListByCriteria(); }" /></th>
				<th>&nbsp;<input class="text1" type="text" id="patient_name" name="patient_name" size="25"
					onkeyup="if(event.which == '13') { fetchRecruitListByCriteria(); }" /></th>
			</tr>
			<logic:empty name="recruitList">
				<tr>
					<th colspan="7"><div class="nodata">
							<bean:message key="recruitment.list.nodata" />
						</div></th>
				</tr>
			</logic:empty>
			<logic:present name="recruitList">
				<logic:iterate id="recruit" name="recruitList"
					type="RecruitmentBean">
					<tr>
						<td><div class="alignCenter"><%=++i%></div></td>
						<td><bean:write name="recruit" property="batch_no" /></td>
						<td><bean:write name="recruit" property="civil_id" /></td>
						<td><a href="/eclinic/recruitmentAction.do?method=recruitmentWorkbench&consult_id=<bean:write name="recruit" property="consult_id" />"><bean:write name="recruit" property="patient_name" /></a></td>
						<td><bean:write name="recruit" property="mobile_no" /></td>
						<td><bean:write name="recruit" property="dateOfBirth" /></td>
						<td><bean:write name="recruit" property="op_number" /></td>
					</tr>
				</logic:iterate>
			</logic:present>
		</table>
	</form>
	</div>
</body>
</html>