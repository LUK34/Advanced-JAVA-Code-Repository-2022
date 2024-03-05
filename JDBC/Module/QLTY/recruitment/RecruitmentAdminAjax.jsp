
<%
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ page
	import="java.util.*,eclinic.registration.bean.RecruitmentBean,eclinic.registration.bean.RegistrationBean,eclinic.domain.logic.RecruitmentLogic"%>
<style type="text/css">
.nodata {
	text-align: center;
	color: black;
}

table, th, td {
	padding: 8px;
	border: 1px solid black;
	border-collapse: collapse;
}

.center {
	margin-left: auto;
	margin-right: auto;
}
</style>
<script type='text/javascript'
	src='/eclinic/bootstrap/js/jquery-1.10.2.min.js'></script>
<script type='text/javascript'
	src='/eclinic/bootstrap/js/jqueryui-1.10.3.min.js'></script>
<script type='text/javascript'
	src='/eclinic/bootstrap/js/bootstrap.min.js'></script>
<script type="text/javascript"
	src="/eclinic/eclinic_jsp/js/recruitment/common.js"></script>
<script type="text/javascript"
	src="/eclinic/eclinic_jsp/js/recruitment/recruitmentList.js"></script>
<%
RegistrationBean regBean=(RegistrationBean)request.getAttribute("registrationBean");



List<RegistrationBean> recStatusDeptWiseList = (ArrayList)request.getAttribute("recStatusDeptWiseList");

RegistrationBean getRecruitPatientStatus=(RegistrationBean)request.getAttribute("finalRecruitStatus");

%>
<div class="main-body-container">
	<input type="hidden" id="op_number"
		value='<%= regBean.getOp_number()%>' />
	<table class="fheading33 center" id="deptStatusTable">
		<tr>
			<th background="/eclinic/images/shade.gif" colspan="4"><b>Fitness
					Details</b></th>
		</tr>


		<tr>
			<th width="5%"><strong>&nbsp;<bean:message
						key="global.header.slNo" /></strong></th>
			<th width="15%"><strong>Department</strong></th>
			<th width="15%"><strong>Fitness Status</strong></th>
			<th width="15%"><strong>Fitness Remarks</strong></th>

		</tr>
		<tr>
			<%
		if(!recStatusDeptWiseList.isEmpty()) {
			int i=1;
					for(RegistrationBean rbean:recStatusDeptWiseList) {
					
						%>
		
		<tr>
			<th><div class="alignCenter"><%=i++%></div></th>
			<th>
				<div class="alignCenter">
					<%=rbean.getDepartment_name()%>
				</div>
			</td>
			<th>



				<div class="alignCenter">

					<%= rbean.getRecruit_patient_status() %>
				</div>
			</th>
			<th>
				<div class="alignCenter">

					<%= rbean.getRecruit_patient_remarks() %></div>
			</th>
			<% }}%>
		</tr>
	</table>
	<br>
	<br>
	<table class="fheading center" id="recruit-patient-status"
		style="width: 500px;">
		<tr>
			<th width="40%">&nbsp;Final Fitness Status</th>
			<td width="60%"><input id="recStatusInput"
				value="<%=getRecruitPatientStatus.getRecruit_patient_status() != null ? getRecruitPatientStatus.getRecruit_patient_status() : "" %>"
				onclick="getSelectDropDown()" /> <select class="text1"
				id="Frecruit_patient_status" name="RegistrationForm"
				style="width: 200px; display: none;">
					<option value="0">--- Select ---</option>
					<option value="Fit">Fit</option>
					<option value="Unfit">Unfit</option>
					<option value="Absent">Absent</option>
					<option value="Pending">Pending</option>
			</select></td>


		</tr>
		<tr>
			<th>Final Medical remarks</th>
			<td><textarea name="Fremarks" id="Fremarks" cols="30" rows="2"><%=getRecruitPatientStatus.getRecruit_patient_remarks() %></textarea></td>
		</tr>
		<tr>
			<th colspan="2"><div align="center">
					<input type="button" name="Button" value="Update" id="button"
						class="buttonff" onclick="finalRecruitPatientStatusSave()" />
				</div></th>
		</tr>
	</table>
</div>