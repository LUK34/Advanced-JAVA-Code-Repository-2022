<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<table class="fheading">
	<tr>
		<th colspan="5" align="right" background="/eclinic/images/shade.gif">
			<div align="left">
				<strong>&nbsp;Investigation</strong>&nbsp;&nbsp; <a
					href="javascript:searchLabTest()"><img src="/eclinic/images/addicon.png" border="0" width="14" height="14"></a>
			</div>
		</th>
	<tr>
		<th width="5%"><div align="center"><bean:message key="global.header.slNo"/> </div></th>
		<th width=""><div align="left"><bean:message key="global.billing.labTestName"/> </div></th>
		<th width="15%"><div align="center"><bean:message key="global.common.quantity"/></div></th>
		<th width="20%"><div align="left"><bean:message key="global.app.remarks"/></div></th>
		<th width="10%"><div align="center"><bean:message key="global.header.action"/></div></th>
	</tr>
	<jsp:include page="/eclinic_jsp/recruitment/tabmenu/InvestigationList.jsp" />
</table>
<jsp:include page="/eclinic_jsp/recruitment/tabmenu/MedicalStatusTab.jsp" />