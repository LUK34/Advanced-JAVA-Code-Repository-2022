<%     
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ page language="java" session = "true" import="java.text.SimpleDateFormat,java.util.Date,eclinic.registration.bean.VitalSignsBean,eclinic.registration.bean.MedicalMandatoryBean,eclinic.registration.bean.RegistrationBean,eclinic.registration.bean.UserBean" %>
<style type="text/css">
.nodata {
	text-align: center;
	color: black;
}
</style>
<%
UserBean userBean=new UserBean();
if(session.getAttribute("userDetails")!=null){
	userBean=(UserBean) session.getAttribute("userDetails");
}
String entryId = "";
int count=3;
SimpleDateFormat sdf_dayMonthYr=new SimpleDateFormat("dd-MM-yyyy HH:mm");
SimpleDateFormat sdf_monthDayYr=new SimpleDateFormat("MMM dd, yyyy  hh:mm a");
%>
<bean:define id="mandatoryColourBean"  name="medicalMandatoryBean" type="MedicalMandatoryBean" scope="request"/>
<bean:define id="regBean" name="regsBean" type="RegistrationBean" scope="request"/>
<table  class="fheading">
  <tr>
    <th colspan="7"> <table class="fheading">
        <logic:notEmpty name="vitalSignheading">
          <logic:iterate id="vitalheads" name="vitalSignheading" type="VitalSignsBean">
            <tr>
          <th colspan="7" background="/eclinic/images/shade.gif"><div align="left"><span class="<%=mandatoryColourBean.getVital_signs()%>"><strong><%=vitalheads.getHeading_name()%></strong></span>&nbsp;&nbsp;
		  </div>
         </th>
        </tr> 
        <tr><td>
        <div id="span_vitals_<%=vitalheads.getVital_type()%>">
        <table class="fheading" width="100%">
          <logic:notEmpty name="vitalSignList">
          <logic:iterate id="vitalSign" name="vitalSignList" type="VitalSignsBean">
          <% if(vitalSign.getVital_type().equals(vitalheads.getVital_type())) { %>
            <%
            
            if(!vitalSign.getEntry_id().equals(entryId))
            {
            %>
            	<tr>
          		<th colspan="4" ><div align="left"><strong>Entered On - 
          		 <% if(null !=vitalSign.getEntered_date() && !vitalSign.getEntered_date().equals("")) { %>
					<%=sdf_monthDayYr.format(sdf_dayMonthYr.parse(vitalSign.getEntered_date()))%>
				<% } %>
          		</strong></div></th>

        		<th colspan="2" ><%if(!userBean.getUser_id().equals(vitalSign.getEnteredby())){%>
            <div align="right"><strong><bean:message key="global.common.enteredBy"/>-<%=vitalSign.getEnteredby_name()%></strong></div>
             <%}else{
           
	  		SimpleDateFormat sdf2=new SimpleDateFormat("dd/MM/yyyy HH:mm");
	  		SimpleDateFormat sdf3=new SimpleDateFormat("dd-MM-yyyy HH:mm");
	  		String dateStart = sdf2.format(sdf3.parse(vitalSign.getEntered_date()));
			String dateStop = sdf2.format(new Date());
	 
			Date d1 = null;
			Date d2 = null;
			long diff = 0;
			try {
				d1 = sdf2.parse(dateStart);
				d2 = sdf2.parse(dateStop);
	 
				//in milliseconds
				diff = d2.getTime() - d1.getTime();

			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			
			<%if(userBean.getUser_id().equals(vitalSign.getEnteredby()) && diff<= (60 * 60 * 1000))
			{
		    %>	
           <div align="right"><strong>
		   <a href="javascript:editVitalSigns('<%=vitalSign.getEntry_id()%>','<%=vitalSign.getVital_type()%>')" title="Edit Vital Signs"><bean:message key="global.common.enteredBy"/>-<%=vitalSign.getEnteredby_name()%></strong>&nbsp;
			<%
			}
			else
			{
			%>
			  <div align="right"><strong><bean:message key="global.common.enteredBy"/>-<%=vitalSign.getEnteredby_name()%></strong>&nbsp;
			 <%
			 }
			 %>
		  <%if(diff<= (24 * 60 * 60 * 1000))
			{
		  %>			
           <a href="javascript:deleteVitalSigns('<%=vitalSign.getEntry_id()%>','<%=vitalSign.getVital_type()%>')">
							<img src="/eclinic/images/delete.png" title="Delete Vital Sign" alt="Delete Vital Sign" width="9" height="9" border="0"></a>&nbsp;&nbsp;</div>
            <%
            }
            }%></th>
        		</tr>
            
            <% 
            entryId = vitalSign.getEntry_id();
            count = 3;
            }
	if(count%3==0){
	%>
            <tr>
              <% } //if(vitalSign.getValue()!=null && !vitalSign.getValue().equals("")) {
              if((vitalSign.getValue()!=null && !vitalSign.getValue().equals("")) || (vitalSign.getMethod()!=null && !vitalSign.getMethod().equals(""))) {
              %>
              <th width="10%"><%=vitalSign.getVital_sign()%></th>
              <td width="20%"><div align="left">
                  <span class="<%=vitalSign.getStyle()%>">
                  	<%=vitalSign.getValue()%> <%=vitalSign.getUnit() %> 
                  	<% if(null != vitalSign.getMethod() && !vitalSign.getMethod().equals("")){ %>
                  		<%=vitalSign.getMethod()%>
                  	<% } %>
                 </span>
                  
				  <% 
				  }
				  %>
				  </div></td>
            
              <%
	if(count/3==0){
	%>
           </tr>
            <% }
            /*if(vitalSign.getValue()!=null && !vitalSign.getValue().equals(""))  {*/
            if((vitalSign.getValue()!=null && !vitalSign.getValue().equals("")) || (vitalSign.getMethod()!=null && !vitalSign.getMethod().equals(""))) {
             %>
            <% count++; }%>
            
            <% } %>
            
            </logic:iterate></logic:notEmpty>
             <logic:empty name="vitalSignList">
       			 <tr><td colspan="7"><div class="nodata">
					<bean:message key="recruitment.list.nodata" />
				</div>
        </td></tr>
        </logic:empty>
            </table></div>
          </logic:iterate>
        </logic:notEmpty>
        </table>
        </th> </tr>
	 </table>