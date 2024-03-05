
<%
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ page language="java" session="true"
	import="eclinic.registration.bean.RecruitmentBean,eclinic.registration.bean.OfficeLetterHeadBean,eclinic.registration.bean.UserBean"%>
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

.black {
	color: black;
}

.red {
	color: red;
}

.bold {
	font-weight: bold;
}

.top-line {
	border-top: 1px solid #006699;
}

.padding5 {
	padding: 5px;
}
</style>
<script type="text/javascript"
	src="/eclinic/eclinic_jsp/js/recruitment/common.js"></script>
<script type="text/javascript"
	src="/eclinic/eclinic_jsp/js/recruitment/recruitmentWB.js"></script>
</head>
<body>
<%
	UserBean userBean = new UserBean();
	if (session.getAttribute("userDetails") != null) {
		userBean = (UserBean) session.getAttribute("userDetails");
	}
%>
<div class="main-body-container">
<form id="recruitmentForm">
	<input type="hidden" id="op_number" name="op_number" value="<bean:write name="recruitDetails" property="op_number" />" />
	<input type="hidden" id="consult_id" name="consult_id" value="<bean:write name="recruitDetails" property="consult_id" />" />
	<input type="hidden" id="department_id" name="department_id" value="<bean:write name="recruitDetails" property="department_id" />" />
	<input type="hidden" id="department_name" name="department_name" value="<bean:write name="recruitDetails" property="department_name" />" />
	<input type="hidden" id="patient_age" name="patient_age" value="<bean:write name="recruitDetails" property="patient_age" />" />
	<input type="hidden" id="consult_date" name="consult_date" value="<bean:write name="recruitDetails" property="consultDate" />" />
	<input type="hidden" id="method" name="method" />
	<input type="hidden" id="vital_type" name="vittype" value="V" />
	<input type="hidden" id="master_id" name="master_id" />
	<input type="hidden" id="insurar_status" name="insurar_status" />
	<input type="hidden" id="insurar_id" name="insurar_id" />
	<input type="hidden" id="labtest_id" name="labtest_id" />
	<input type="hidden" id="serial_id" name="serial_id" />
	<table class="fheadingIP">
		<tr>
			<th colspan="2"><div class="padding5">
					<b>|</b>
					<bean:write name="recruitDetails" property="consultDate1" />
					<b>|</b>
					<bean:message key="global.reg.name" />
					&nbsp;&nbsp;<span class="black bold"><bean:write
							name="recruitDetails" property="patient_name" /></span>
					<div style="float: right;">
						<a href="/eclinic/recruitmentAction.do?method=recruitmentList" class="a_linlkist2">
							<img src="/eclinic/images/back.png" alt="Back" title="Back" width="16" height="16" border="0"></a>
					</div>
				</div></th>
		</tr>
		<tr>
			<th colspan="2" class="top-line"><div class="padding5">
					<bean:message key="global.common.civilId" />
					&nbsp;&nbsp; <span class="black bold"><bean:write
							name="recruitDetails" property="civil_id" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<bean:message key="global.revisit.mobileno" />
					&nbsp;&nbsp; <span class="black bold"><bean:write
							name="recruitDetails" property="mobile_no" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<bean:message key="global.reg.dateOfBirth" />
					&nbsp;&nbsp; <span class="black bold"><bean:write
							name="recruitDetails" property="dateOfBirth" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<bean:message key="global.reg.age" />
					&nbsp;&nbsp; <span class="black bold"><bean:write
							name="recruitDetails" property="patientAge" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<bean:message key="global.reg.nationality" />
					&nbsp;&nbsp; <span class="black bold"><bean:write
							name="recruitDetails" property="nationality" /></span>
				</div></th>
		</tr>
	</table>
	<span id="span_latestvitals">
		<jsp:include page="/eclinic_jsp/medical/ViewLatestVitalSigns.jsp" />
	</span>
	<!-- MENU TABS START -->
	<table class="fheading33">
	<tr>
      <td width="100%">
      	<div class="tab-container">
          <ul id="maintab" class="nav nav-tabs">
          		<% String activeClass="active"; boolean defaultValue = false; String defaultTab = ""; String firstTab = null; %>
          		<logic:notEmpty name="officePrivList">
          			<!-- Office wise Tab privilege -->
					<logic:iterate id="tabList" name="officePrivList" type="OfficeLetterHeadBean">
						<!-- User Should have Tab wise privilege -->
						<% if("Y".equals(userBean.getUserPrivilege("recruitment_" + tabList.getPrivilege_label()))) { %>
						<% 
							defaultValue = "Y".equals(tabList.getDefault_value());
							if(defaultValue) {
								defaultTab = tabList.getPrivilege_label();
							}
							if(firstTab == null) {
								firstTab = tabList.getPrivilege_label();
							}
						%>
						<li id="<%=tabList.getPrivilege_label()%>" class="<%=defaultValue ? activeClass : "" %>">
							<a href="javascript:showWindow('<%=tabList.getPrivilege_label()%>');" title="<%=tabList.getPrivilege_name()%>">
								<%=tabList.getPrivilege_name()%>
							</a>
						</li>
						<% } %>
					</logic:iterate>
					<% 
						if((defaultTab == null || defaultTab.trim().equals("")) && firstTab != null && !firstTab.trim().equals("")) {
							defaultTab = firstTab;
						}
					%>
				</logic:notEmpty>
          </ul>
        </div>
        <div id="tab-content">
        	<logic:empty name="officePrivList">
        		<div class="alignCenter red"><bean:message key="global.common.noPrivilege" /></div>
        	</logic:empty>
        </div>
      </td>
   </tr>
   </table>
<div class="modal fade" id="defaultModal"  data-backdrop="static"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow-y: hidden;></div>
<script type="text/javascript">
	<% if(defaultTab != null && !defaultTab.trim().equals("")) { %>
			showWindow('<%=defaultTab %>');
	<% } %>
</script>
<div id="forwarder" style="visibility: collapse; position: fixed; top: 20%; font-weight: bold;"></div>
</form>
</div>
<div class="loadingDiv" style="display: none; position: fixed; top: 20%; left: 40%; z-index: 1051">
	<span><img src='/eclinic/images/loader.gif' /></span>&nbsp;&nbsp;<span class="msg" style="font-weight: bold;"></span>
</div>
<div class="alertDiv" style="display: none; position: fixed; top: 20%; left: 40%; width: 50%; font-weight: bold; z-index: 1051"></div>
</body>
</html>