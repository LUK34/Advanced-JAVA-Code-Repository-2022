<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ page language="java" session = "true" import="eclinic.registration.bean.SetupBean,eclinic.registration.bean.UserBean" %>

<logic:empty name="labList">
	<tr>
		<td colspan="5"><div align="center">
				<bean:message key="global.billing.noLabTest" />
			</div></td>
	</tr>
</logic:empty>
<% 
	UserBean userBean=new UserBean();
	if(session.getAttribute("userDetails")!=null){
		userBean=(UserBean)session.getAttribute("userDetails");
	}

	int i = 0; 
	String labType = "", lastType = "";
	String user_id = ((UserBean) session.getAttribute("userDetails")).getUser_id();
%>
<logic:notEmpty name="labList">
	<logic:iterate id="lab" name="labList" type="SetupBean">
		<%
			labType = lab.getLab_type();
			labType = labType != null ? labType : "";
			pageContext.setAttribute("diffHead", lastType.equals(labType) ? "N" : "Y");
		%>
	<logic:equal name="diffHead" value="Y">
		<tr>
			<th colspan="5">
				<% out.print(labType.equals("L") ? "Investigation" : "X-Ray"); %>
			</th>
		</tr>
	</logic:equal>
		<tr>
			<td style="text-align: center;"><%=++i %></td>
			<td><bean:write name="lab" property="labtest_name" /></td>
			<td style="text-align: center;"><bean:write name="lab" property="quantity" /></td>
			<td>
			<%if(null == lab.getRemarks() || lab.getRemarks().equals("null")) { %>
			<% } else { %>
				<%=lab.getRemarks()%>
			<% } %>
			&nbsp;
			<%if(null == lab.getUser_name() || lab.getUser_name().equals("null")) { %>
			<% } else { %>
				<%=lab.getUser_name()%>
			<% } %>
			</td>
			<td style="text-align: center;">
				<logic:equal name="lab" property="samp_collect" value="N">
					<logic:equal name="lab" property="enteredby" value="<%=user_id %>">
						<a href="javascript:deleteLabTest('<bean:write name="lab" property="serial_id" />')">
							<img src="/eclinic/images/delete.png" width="9" height="9" border="0" />
						</a>
					</logic:equal>
				</logic:equal>
				<logic:equal name="lab" property="closed_status" value="Y">
					<logic:equal name="lab" property="lab_type" value="L">
						<a href="javascript:showPopUpAttach('/eclinic/testReportAction.do?testDetailsid=<bean:write name="lab" property="test_Detailsid" />&ltestid=<bean:write name="lab" property="labtest_id" />&labno=<bean:write name="lab" property="lab_idno" />')" class="a_linlkist2">
							<img src="/eclinic/images/view.jpeg" alt="View" title="View Lab Report" width="11" height="11" border="0" /></a>
					</logic:equal>
					<logic:notEqual name="lab" property="lab_type" value="L">
						<a href="javascript:showPopUpAttach('<%=userBean.getPacsUrl()%><bean:write name="lab" property="labtest_id" />')" class="a_linlkist2"> <img  align="absmiddle" src="/eclinic/images/pacs.png" alt="View" title="PACS View" width="15" height="15" border="0"></a>&nbsp;
						<a href="javascript:showPopUpAttach('/eclinic/testReportRadAction.do?testDetailsid=<bean:write name="lab" property="test_Detailsid" />&ltestid=<bean:write name="lab" property="labtest_id" />&labno=<bean:write name="lab" property="lab_idno" />')" class="a_linlkist2">
							<img src="/eclinic/images/view.jpeg" alt="View" title="View Lab Report" width="11" height="11" border="0" /></a>
					</logic:notEqual>
				</logic:equal>
			</td>
			<%
			lastType = labType;
			%>
		</tr>
	</logic:iterate>
</logic:notEmpty>
