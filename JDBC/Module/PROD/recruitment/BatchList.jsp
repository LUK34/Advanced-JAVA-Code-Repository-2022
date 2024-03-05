
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
			<td><div class="alignCenter"><%=++i%></div></td>
			<td><a style="cursor: pointer;" 
							onclick="fetchBatchMembers('<bean:write name="batch" property="batch_id" />', '<bean:write name="batch" property="batch_no" />')">
							<bean:write name="batch" property="batch_no" /></a></td>
			<td><bean:write name="batch" property="recruitedDate" /></td>
			<td><bean:write name="batch" property="recruited_by" /></td>
		</tr>
	</logic:iterate>
</logic:present>