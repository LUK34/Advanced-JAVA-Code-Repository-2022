<%     
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ page language="java" session = "true" import="eclinic.domain.logic.ClinicLogic,java.util.ArrayList,java.util.Iterator,eclinic.registration.bean.UserBean,eclinic.registration.bean.RecruitmentBean,java.text.DecimalFormat,java.util.*"%>
<%
UserBean userBean=new UserBean();
if(session.getAttribute("userDetails")!=null){
	userBean=(UserBean)session.getAttribute("userDetails");
}
RecruitmentBean regBean = new RecruitmentBean();
ArrayList list =(ArrayList)request.getAttribute("recruitList");
pageContext.setAttribute("recruitList",list);



int i=1;
%>


<div class="panel panel-primary">
	<div class="table-responsive">
	<table class="fheading33">
		
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
	
	
	
