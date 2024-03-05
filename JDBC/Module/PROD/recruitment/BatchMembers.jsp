
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
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4 class="modal-title">
				<strong><bean:message key="recruitment.batch.members" /> - <bean:write name="RecruitmentForm" property="batch_no" /></strong>
			</h4>
		</div>
		<div class="modal-body" style="height: 400px; overflow-y: auto;">
			<input class="text1" type="hidden" id="batch_id" value="<bean:write name="RecruitmentForm" property="batch_id" />" />
			<table class="fheading33" id="recruitList">
				<tr>
					<th width="5%" rowspan="2"><strong>&nbsp;<bean:message
								key="global.header.slNo" /></strong></th>
					<th width="15%"><strong>&nbsp;<bean:message
								key="global.common.civilId" /></strong></th>
					<th rowspan="2"><strong>&nbsp;<bean:message key="global.reg.name" /></strong></th>
					<th width="15%" rowspan="2"><strong>&nbsp;<bean:message
								key="global.revisit.mobileno" /></strong></th>
					<th width="15%" rowspan="2"><strong>&nbsp;<bean:message
								key="global.reg.dateOfBirth" /></strong></th>
					<th width="15%" rowspan="2"><strong>&nbsp;<bean:message
								key="global.reg.regNumber" /></strong></th>
				</tr>
				<tr>
					<th>&nbsp;<input class="text1" type="text" id="civil_id" onkeyup="if(event.which == '13') { fetchBatchMembersByCriteria(); }" /></th>
				</tr>
				<logic:empty name="recruitList">
					<tr>
						<th colspan="6"><div class="nodata">
								<bean:message key="recruitment.list.nodata" />
							</div></th>
					</tr>
				</logic:empty>
				<logic:present name="recruitList">
					<logic:iterate id="recruit" name="recruitList"
						type="RecruitmentBean">
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
			</table>
		</div>
	</div>
</div>