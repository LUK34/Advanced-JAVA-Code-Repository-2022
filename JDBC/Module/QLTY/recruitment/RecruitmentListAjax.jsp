
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
		<th width="15%"><strong>&nbsp;<bean:message
					key="global.reg.dateOfBirth" /></strong></th>
		<th width="15%"><strong>&nbsp;<bean:message
					key="global.reg.op_number" /></strong></th>
		<th width="15%"><strong>&nbsp;<bean:message
					key="recruitment.status" /></strong></th>
		<th width="15%"><strong>&nbsp;Action</strong></th>
	</tr>
	<tr>

		<th><input class="text1" type="text" id="batch_id"
			name="batch_id" size="10"
			onkeyup="if(event.which == '13') { fetchRecruitListByCriteria(); }" /></th>
		<th><input class="text1" type="text" id="civil_id"
			name="civil_id" size="15"
			onkeyup="if(event.which == '13') { fetchRecruitListByCriteria(); }" /></th>
		<th><input class="text1" type="text" id="patient_name"
			name="patient_name" size="25"
			onkeyup="if(event.which == '13') { fetchRecruitListByCriteria(); }" /></th>
		<th><input class="text1" type="text" id="date_of_birth"
			name="date_of_birth" size="25"
			onkeyup="if(event.which == '13') { fetchRecruitListByCriteria(); }" /></th>
		<th><input class="text1" type="text" id="op_number"
			name="op_number" size="25"
			onkeyup="if(event.which == '13') { fetchRecruitListByCriteria(); }" /></th>

		<!-- <th><input class="text1" type="text" size="25"
					onkeyup="if(event.which == '13') { fetchRecruitListByCriteria(); }" /></th> -->
		<th><div align="center">
				<select id="recruit_patient_status" name="recruit_patient_status"
					class="text1" style="width: 100px;"
					onchange="fetchRecruitListByCriteria()">
					<option value="All" selected>All</option>
					<option value="Pending">Pending</option>
					<option value="Unfit">Unfit</option>
					<option value="Fit">Fit</option>
					<option value="Absent">Absent</option>
				</select>
			</div></th>
	</tr>

	<logic:empty name="recruitList">
		<tr>
			<th colspan="7"><div class="nodata">
					<bean:message key="recruitment.list.nodata" />
				</div></th>
		</tr>
	</logic:empty>
	<logic:present name="recruitList">
		<logic:iterate id="recruit" name="recruitList" type="RecruitmentBean">
			<tr>
				<td><div class="alignCenter"><%=++i%></div></td>
				<td><bean:write name="recruit" property="batch_id" /></td>
				<td><bean:write name="recruit" property="civil_id" /></td>
				<td><a
					href="/eclinic/recruitmentAction.do?method=recruitmentWorkbench&consult_id=<bean:write name="recruit" property="consult_id" />"><bean:write
							name="recruit" property="patient_name" /></a></td>
				<td><bean:write name="recruit" property="dateOfBirth" /></td>
				<td><bean:write name="recruit" property="op_number" /></td>
				<td><bean:write name="recruit"
						property="recruit_patient_status" /></td>
				<td><a title="DeptWise Recruit Status"
										href="/eclinic/recruitmentAction.do?method=getDepartmentWiseRecruitStatus&op_number=<bean:write name="recruit" property="op_number" />&showGB=true" onClick="return GB_showFullScreen('Batchwise Registration', this.href)" title="FileHistory"><img
											src="/eclinic/images/submit2.jpg"
											alt="DeptWise Recruit Status" title="DeptWise Recruit Status"
											border="0" width="20" height="15" hspace="0" vspace="0"></a>
									</td>
			</tr>
		</logic:iterate>
	</logic:present>
</table>
