<%     
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ page language="java" session = "true" import="eclinic.domain.logic.ClinicLogic,java.util.ArrayList,java.util.Iterator,eclinic.registration.bean.UserBean,eclinic.registration.bean.RecruitmentBean,java.text.DecimalFormat,java.util.*"%>


<html>
<head>
<title>Recruitment Registration</title>
<LINK media=screen href="/eclinic/css/clinic.css" type=text/css rel=stylesheet>
<script type='text/javascript' src='/eclinic/bootstrap/js/jquery-1.10.2.min.js'></script>  
<script type='text/javascript' src='/eclinic/bootstrap/js/jqueryui-1.10.3.min.js'></script> 
<script type='text/javascript' src='/eclinic/bootstrap/js/bootstrap.min.js'></script> 
<SCRIPT type="text/javascript" src="/eclinic/eclinic_jsp/js/recruitment/recruitment.js"></script>
<SCRIPT type="text/javascript" src="/eclinic/eclinic_jsp/js/recruitment/common.js"></script>
</head>
</script>
<body>
<%
UserBean userBean=new UserBean();
if(session.getAttribute("userDetails")!=null){
	userBean=(UserBean)session.getAttribute("userDetails");
}
RecruitmentBean regBean = new RecruitmentBean();
ArrayList list =(ArrayList)request.getAttribute("recruitList");
pageContext.setAttribute("recruitList",list);
System.out.println("recruitList : "  +list);
int i=1;
%>


<html:form action="/recruitmentAction.do">
<html:hidden property="count"/>
<html:hidden property="selected"/>
<html:hidden property="selected_box" value='0'/>

<div class="modal modal-med fade" id="mediumModal"  data-backdrop="static"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow-y: hidden;>
</div>
<div class="modal fade" id="defaultModal"  data-backdrop="static"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow-y: hidden;></div>
<div align="center">
<table class="fheading33">
<div class="loadingDiv" style="display: none; position: fixed; top: 20%; left: 40%; z-index: 1051">
	<span><img src='/eclinic/images/loader.gif' /></span>&nbsp;&nbsp;<span class="msg" style="font-weight: bold;"></span>
</div>
<tr>

				<th width="12%"><strong>&nbsp;<bean:message
								key="global.common.civilId" /></strong></th>
					<th width="10%" ><strong>&nbsp;Recruitmnet Id</strong></th>
					<th width="12%"><strong>&nbsp;<bean:message key="global.reg.name" /></strong></th>
					<th width="12%" ><strong>&nbsp;<bean:message
								key="global.revisit.mobileno" /></strong></th>
					<th width="12%"><strong>&nbsp;<bean:message
								key="global.reg.dateOfBirth" /></strong></th>
					<th width="12%" ><strong>&nbsp;Applied Position</strong></th>
					<th width="12%"><strong>&nbsp;Nationality</strong></th>
					<!-- <th width="10%" rowspan="2"><strong>&nbsp;Action</strong></th> -->
				</tr>
				<tr>
				
					<th>&nbsp;<input class="text1" type="text" id="civil_id" onkeyup="if(event.which == '13') {fetchBatchMembersByCriteria(); }" /></th>
					<th>&nbsp;<input class="text1" type="text" id="recruitmentID" onkeyup="if(event.which == '13') { fetchBatchMembersByCriteria(); }" /></th>
					<th>&nbsp;<input class="text1" type="text" id="patient_name" onkeyup="if(event.which == '13') { fetchBatchMembersByCriteria(); }" /></th>
					<th>&nbsp;<input class="text1" type="text" id="mobile_no" onkeyup="if(event.which == '13') { fetchBatchMembersByCriteria(); }" /></th>
					<th>&nbsp;<input class="text1" type="text" id="date_of_birth" onkeyup="if(event.which == '13') { fetchBatchMembersByCriteria(); }" /></th>
					<th>&nbsp;<input class="text1" type="text" id="appliedPosition" onkeyup="if(event.which == '13') { fetchBatchMembersByCriteria(); }" /></th>
					<th>&nbsp;<input class="text1" type="text" id="nationality" onkeyup="if(event.which == '13') { fetchBatchMembersByCriteria(); }" /></th>
					 
				</tr>
				</table>
				<span id="loadspan"></span>
</div>
<span id="resultspan">
<div class="panel panel-primary">
	<div class="table-responsive">
	<table class="fheading33">
			<tr>
			<th width="6%"><div align="center"><input name="checkall" type="checkbox" id="checkall" onClick="checkedAll()" value="checkbox"></div></th> 
					<!-- <th width="6%"rowspan="2"><div align="center"><input type="checkbox" name="checkall_id" id="checkall_id" onClick="checkedAll_Sid('RecruitmentForm')"></div></th> -->
				
					<th width="8%"><strong>&nbsp;<bean:message
								key="global.header.slNo" /></strong></th>
					<th width="12%"><strong>&nbsp;<bean:message
								key="global.common.civilId" /></strong></th>
					<th width="10%" ><strong>&nbsp;Recruitmnet Id</strong></th>
					<th width="12%"><strong>&nbsp;<bean:message key="global.reg.name" /></strong></th>
					<th width="12%" ><strong>&nbsp;<bean:message
								key="global.revisit.mobileno" /></strong></th>
					<th width="12%"><strong>&nbsp;<bean:message
								key="global.reg.dateOfBirth" /></strong></th>
					<th width="12%" ><strong>&nbsp;Applied Position</strong></th>
					<th width="12%"><strong>&nbsp;Nationality</strong></th>
					<!-- <th width="10%" rowspan="2"><strong>&nbsp;Action</strong></th> -->
				</tr>	
	  <logic:iterate id="recruit" name="recruitList" type="RecruitmentBean">
	  
	   <logic:empty name="recruit">
		 <tr>
				<td colspan="7"><div align="center"><bean:message key="global.common.noRecordsFound"/> </div></td>
			</tr>
	</logic:empty>
	
	
	  <logic:notEmpty name="recruit">
			<tr>
							<td width="3%"><div align="center"><input type="checkbox" name="recruitIds" id="recruitIds" value="<%=recruit.getSerial_id()%>" /></div></td>
							<td><div class="alignCenter"><%=i++%></div></td>
							<td><bean:write name="recruit" property="civil_id" /></td>
							<td><bean:write name="recruit" property="recruitmentID" /></td>
							<td><bean:write name="recruit" property="patient_name" /></td>
							<td><bean:write name="recruit" property="mobile_no" /></td>
							<td><bean:write name="recruit" property="date_of_birth" /></td>
							<td><bean:write name="recruit" property="appliedPosition" /></td>
							<td><bean:write name="recruit" property="nationality" /></td>
							<input type="hidden" name="recruitIds" id="batch_id" value="<%=recruit.getBatch_id()%>" />
						</tr>
						</logic:notEmpty>
		</logic:iterate>
		
		
		
	</table>
	</div>
	</div>
	</span>
	<table>
	<tr>
		<td>
		<div align="center">
		<input name="button22" class="buttonff" type="button" value="Register" onClick="javascript:registerCandidates()"/>
		</div>
		</td> 
	</tr>
	</table>

</div>
</html:form>
</div>
</body>
</html>




