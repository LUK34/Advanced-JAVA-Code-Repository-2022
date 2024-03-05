
<%
	response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ page language="java" session="true"
	import="eclinic.registration.bean.RecruitmentBean,eclinic.registration.bean.RegistrationBean,eclinic.domain.logic.RecruitmentLogic,java.util.ArrayList,java.util.*"%>
<html>
<head>
<%
RegistrationBean regBean=(RegistrationBean)request.getAttribute("registrationBean");
RegistrationBean recruitPatientStatusList = RecruitmentLogic.getInstance().getStatusDetailsByID(regBean);
int i=1;
%>

<script type="text/javascript">



</script>
</head>




<body onload="test();">
<input type="hidden" value="<%=recruitPatientStatusList.getRecruit_patient_status()%>" id="recStatus"/>
<table class="fheading" id="recruit-patient-status">
 <tr >
        <th width="12%">&nbsp;Status</th>
        <td width="40%">
      
      <input id="recStatusInput"  value="<%=recruitPatientStatusList.getRecruit_patient_status() %>" onclick="getSelectDropDown()" />
        	 <select tabindex="59" class="text1" id="recruit_patient_status"  name="RegistrationForm"  style="width:250px;display: none;" >
             	   <option value="0">--- Select ---</option>
             		<option value="Fit">Fit</option>
             		<option value="Unfit">Unfit</option>
             		<option value="Absent">Absent</option>
             		<option value="Pending">Pending</option>
              	</select> </td>
              	
              
            	</tr>
            <tr>
   <th><bean:message key="global.common.comments"/></th>
    <td><textarea name="remarks" id="remarks" cols="30" rows="2"><%=recruitPatientStatusList.getRecruit_patient_remarks()%></textarea></td>
  </tr>
  <tr>
    <th colspan="2"><div align="center">
  	<input type="button" name="Button" value="Update" class="buttonff" onclick="recruitPatientStatusSave()"/>
 	</div></th>
  </tr>
</table>
</body>
</html>