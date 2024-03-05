
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
		<%-- 	<th width="10%"><strong>&nbsp;<bean:message
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
		    		<bean:write name="batch" property="batch_id"/></a>
						
					<td><bean:write name="batch" property="count_candidate" /></td>
					<%-- <td><bean:write name="batch" property="recruited_by" /></td> --%>
				</tr>
			</logic:iterate>
		</logic:present>
		
	</table>
	