
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
	src="/eclinic/eclinic_jsp/js/recruitment/recruitment.js"></script>
</head>
<body>
<div class="loadingDiv" style="display: none; position: fixed; top: 20%; left: 40%; z-index: 1051">
	<span><img src='/eclinic/images/loader.gif' /></span>&nbsp;&nbsp;<span class="msg" style="font-weight: bold;"></span>
</div>
<div class="main-body-container">
	<table class="fheading33">
		<tr>
			<th colspan="4" background="/eclinic/images/shade.gif"><strong>&nbsp;<bean:message
						key="recruitment.header" /></strong></th>
		</tr>
		<tr>
			<th width="15%">&nbsp;<bean:message
					key="recruitment.batch.number" /></th>
			<td width="20%"><input class="text1" type="text" id="batch_id" onkeyup="if(event.which == '13') { fetchBatch(); }" /></td>
			<%-- <th width="15%">&nbsp;<bean:message
					key="recruitment.recruit.candidateCount" /></th>
			<td><input class="text1" size="10" type="text" id="recruited_date" /> --%>
			<td><input class="buttonff" type="button"
				onclick="fetchBatch();"
				value="<bean:message key="global.menu.search" />" />
			</td>
		</tr>
	</table>
		<span id="resultspanBatch">
	<table class="fheading33" id="batchList">
		<tr>
			<th colspan="6" background="/eclinic/images/shade.gif"><strong>&nbsp;<bean:message
						key="recruitment.batch.members" /></strong></th>
		</tr>
		<tr>
			<th width="5%"><strong>&nbsp;<bean:message
						key="global.header.slNo" /></strong></th>
			<th width="15%"><strong>&nbsp;<bean:message
						key="recruitment.batch.number" /></strong></th>
			<th width="15%"><strong>&nbsp;<bean:message
						key="recruitment.recruit.candidateCount" /></strong></th>
			<%-- <th width="10%"><strong>&nbsp;<bean:message
						key="recruitment.recruit.by" /></strong></th> --%>
		</tr>
	
		<%
			int i = 1;
		%>
		<logic:empty name="batchList">
			<tr>
				<th colspan="4"><div class="nodata">
						<bean:message key="recruitment.list.nodata" />
					</div></th>
			</tr>
		</logic:empty>
		<logic:present name="batchList">
			<logic:iterate id="batch" name="batchList" type="RecruitmentBean">
				<tr>
					<td><div class="alignCenter"><%=i++%></div></td>
					<td>
							
							<a class="a_linlkist2" href="/eclinic/recruitmentAction.do?method=fetchBatchMembers&batch_id=<%=batch.getBatch_id()%>&showGB=true"   onClick="return GB_showFullScreen('Batchwise Registration', this.href)" title="FileHistory" class="a_linlkist2">
		    		<bean:write name="batch" property="batch_id"/></a></td>
						
					<td><bean:write name="batch" property="count_candidate" /></td>
					<%-- <td><bean:write name="batch" property="recruited_by" /></td> --%>
				</tr>
			</logic:iterate>
		</logic:present>
		
	</table>
	</span>
</div>
</body>
<script>
initRecruitPage();
</script>
<div class="modal modal-med fade" id="mediumModal"  data-backdrop="static"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow-y: hidden;></div>
</html>