<%     
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ page language="java" session = "true" import="eclinic.domain.logic.ClinicLogic,eclinic.registration.bean.RegistrationBean,eclinic.registration.bean.MedicalMandatoryBean,eclinic.registration.bean.ConsultationBean,eclinic.registration.bean.VitalSignsBean,eclinic.registration.bean.UserBean,eclinic.registration.bean.GlassPrescriptionBean,eclinic.registration.bean.SetupBean,eclinic.registration.bean.HistoryPresentIllBean,java.text.SimpleDateFormat,java.util.*"%>
<%

	UserBean userBean=new UserBean();
	if(session.getAttribute("userDetails")!=null)
	{
		userBean=(UserBean)session.getAttribute("userDetails");
	}
	int i = 1;
	%>
	<html>
<table class="fheading" id="recruit-patient-status">
 <tr >
        <th width="12%">&nbsp;Status</th>
        <td width="40%">
				<select tabindex="59" class="chosen-select" id="recruit_patient_status"  name="RegistrationForm"  style="width:245px;">
             		<option value="0">--- Select ---</option>
             		<option value="Fit">Fit</option>
             		<option value="Unfit">Unfit</option>
             		<option value="Absent">Absent</option>
             		<option value="Pending">Pending</option>
              	</select></td>
            	</tr>
            <tr>
   <th><bean:message key="global.common.comments"/></th>
    <td><textarea name="remarks" id="remarks" cols="30" rows="2"></textarea>
   <input type="button" name="Button" value="Save" id="button" class="buttonff" style="" onclick="recruitPatientStatusSave()"/></td>
  </div></th>
  </tr>
</table>
<div id="loadingDiv" style="top: 50%; left: 50%; display: none; position: fixed;">
	<img src="/eclinic/images/loader.gif" />
</div>
<%-- <div id="recruitPatientStatus">
<table class="fheading33">	
	<tr>
		<th colspan="5" ><div align="left"><strong>Recruit Patient Details</strong>&nbsp;</div></th>
	</tr>
	<tr>
		<th width="5%"><div align="center"><strong>Sl.No</strong></div></th>
		<th width="25%"><div align="center"><strong>Status</strong></div></th>
		<th width="30%"><div align="center"><strong>Remarks</strong></div></th>
		<th width="10%"><div align="center"><strong>Action</strong></div></th>
	</tr>
  <logic:empty name="recruitPatientStatusList">
    <tr>
      <td colspan="5"><div align="center"><bean:message key="global.common.noRecordsFound"/> </div></td>
    </tr>
  </logic:empty>
  <% int i=1; %>
  <logic:notEmpty name="recruitPatientStatusList">
  	<logic:iterate id="recruitPatientStatusList" name="recruitPatientStatusLists" type="RegistrationBean">
	    <tr>
	      <td><div align="center"><%=i++%></div></td>
	      <td><div align="center"><bean:write name="recruitPatientStatusList" property="recruit_patient_status"/></div></td>
	      <td><div align="center"><bean:write name="recruitPatientStatusList" property="recruit_patient_remarks"/></div></td>
	      <td>
	      	<div align="center">
	      		<img title="Edit" src="/eclinic/images/edit.png" width="9" height="9" style="cursor: pointer;" onclick="showRecruitPatientStatus('I','<%=referalList.getSerial_id() %>','<%=referalList.getRemarks() %>')" />
	      		&nbsp;<img title="Delete" src="/eclinic/images/delete.png" width="9" height="9" style="cursor: pointer;" onclick="deleteRecruitPatientStatus(<%=referalList.getSerial_id() %>)" />
	      	</div>
	      </td>
	    </tr>
  	</logic:iterate>
  </logic:notEmpty>
  </table>
  </div> --%>
  
 <%--  <logic:present name="recruitPatientStatusList">
	<logic:iterate id="recruitPatientStatusList" name="recruitPatientStatusList" type="Registrationbean">
		<tr>
			<td><div class="alignCenter"><%=i++%></div></td>
			<td><bean:write name="recruitPatientStatusList" property="recruit_patient_status" /></td>
			<td><bean:write name="recruitPatientStatusList" property="recruit_patient_remarks" /></td>
		</tr>
	</logic:iterate>
</logic:present> --%>
</html>