
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.List,eclinic.registration.bean.RecruitmentBean"%>

<style type="text/css">
.nodata {
	text-align: center;
	color: black;
}
</style>
<input type="hidden" id="type" value="<%=request.getAttribute("type") %>" />
<table class="fheading33">
	<tr>
		<th colspan="3" background="/eclinic/images/shade.gif"><b><bean:message
					key="global.reg.referral" /></b>&nbsp;
					<img style="cursor: pointer;" src="/eclinic/images/addbut.png" title="Add Referral" 
						width="12" height="12" border="0" onclick="addOrUpdateReferral()"></th>
	</tr>
	<logic:empty name="referralList">
		<tr>
			<th colspan="3">
				<div class="nodata">
					<bean:message key="recruitment.list.nodata" />
				</div>
			</th>
		</tr>
	</logic:empty>
	<logic:present name="referralList">
		<logic:iterate id="referral" name="referralList" type="RecruitmentBean">
			<tr>
				<td><bean:write name="referral" property="notes" /></td>
				<td style="width: 25%; border-right: 0px;"><a href="javascript:addOrUpdateReferral('<bean:write name="referral" property="serial_id" />')"><bean:write name="referral" property="entered_user" /></a></td>
				<td style="width:3%; border-left: 0px;"><img style="cursor: pointer;" src="/eclinic/images/failure.jpeg" onclick="deleteReferral('<bean:write name="referral" property="serial_id" />')" 
				alt="Delete" title="Delete" width="13" height="13" border="0"></td>
			</tr>
		</logic:iterate>
	</logic:present>
</table>
