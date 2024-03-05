
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.Map,java.util.List,java.util.LinkedHashMap,eclinic.registration.bean.RecruitmentBean" %>
<style type="text/css">
.nodata {
	text-align: center;
	color: black;
}
</style>

<%
	Map<String, RecruitmentBean> statusMap = (Map) request.getAttribute("statusMap");
	Map<String, List<RecruitmentBean>> notesMap = (Map) request.getAttribute("notesMap");
	Map<String, String> departments = new LinkedHashMap<>();
	departments.put("lab", "Investigation");
	departments.put("dental", "Dental");
	departments.put("ent", "ENT");
	departments.put("radio", "Radiology");
	departments.put("gp", "General Medicine");
	departments.put("ortho", "Orthopedic");
	departments.put("surg", "Surgery");
	
	RecruitmentBean med_status = null;
	RecruitmentBean notes = null;
	String key = null;
%>
<table class="fheading33">
<tr>
	<th background="/eclinic/images/shade.gif" colspan="2"><b>Fitness Details</b></th>
</tr>
	<tr>
		<th colspan="2"><b>Nursing</b></th>
	</tr>
	<tr>
		<th>Notes</th>
		<td>
			<%
				key = "nurse";
				if (notesMap.get(key) != null && notesMap.get(key).size() > 0) {
					notes = notesMap.get(key).get(0);
					out.print(notes.getNotes());
				}
			%>
		</td>
	</tr>
<% 
	for(Map.Entry<String, String> entry : departments.entrySet()) {
		key = entry.getKey();
		med_status = statusMap.get(key);
		notes = null;
		if (notesMap.get(key) != null && notesMap.get(key).size() > 0) {
			notes = notesMap.get(key).get(0);
		}
%>
	<tr>
		<th colspan="2"><b><%=departments.get(key) %></b></th>
	</tr>
	<tr>
		<th width="15%">Medical Status</th>
		<td>
			<%
				if (med_status != null && med_status.getMedical_status() != null) {
					if("F".equals(med_status.getMedical_status()))
						out.print("FIT");
					else if("UF".equals(med_status.getMedical_status()))
						out.print("UN FIT");
				}
			%>
		</td>
	</tr>
	<tr>
		<th>Notes</th>
		<td>
			<%
				if (notes != null) {
					out.print(notes.getNotes());
				}
			%>
		</td>
	</tr>
<%
	}
%>
	<tr>
		<th colspan="2"><b>Opthalmology</b></th>
	</tr>
	<% 
		key = "opthal";
		RecruitmentBean opthal = (RecruitmentBean) request.getAttribute("opthal");
		if(opthal == null) {
			opthal = new RecruitmentBean();
		}
		pageContext.setAttribute("opthal", opthal);
	%>
	<tr>
		<th>&nbsp;Details</th>
		<td>
			<table>
				<tr>
					<th width="10%">&nbsp;<bean:message key="recruitment.opthal.lt" /></th>
					<td><bean:write name="opthal" property="lt" /></td>
					<th width="10%">&nbsp;<bean:message key="recruitment.opthal.rt" /></th>
					<td><bean:write name="opthal" property="rt" /></td>
					<th width="10%">&nbsp;<bean:message key="recruitment.opthal.oph" /></th>
					<td><bean:write name="opthal" property="oph" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<th>Medical Status</th>
		<td>
			<%
				med_status = statusMap.get(key);
				if (med_status != null && med_status.getMedical_status() != null) {
					if("F".equals(med_status.getMedical_status()))
						out.print("FIT");
					else if("UF".equals(med_status.getMedical_status()))
						out.print("UN FIT");
				}
			%>
		</td>
	</tr>
	<tr>
		<th>Notes</th>
		<td>
			<%
				if (notesMap.get(key) != null && notesMap.get(key).size() > 0) {
					notes = notesMap.get(key).get(0);
					out.print(notes.getNotes());
				}
			%>
		</td>
	</tr>
	<tr>
		<th colspan="2"><b>Referral</b></th>
	</tr>
		<%
			key = "ref";
			List<RecruitmentBean> referrals = notesMap.get(key);
		%>
		<% 
			if(referrals != null && referrals.size() > 0) {
				for(RecruitmentBean referral : referrals) {
		%>
	<tr>
		<td colspan="2"><%=referral.getNotes() %></td>
	</tr>
		<%		
				}
			} else {
		%>
	<tr>
		<td colspan="2">
			<div class="nodata">
				<bean:message key="recruitment.list.nodata" />
			</div>
		</td>
	</tr>
		<% 	
			}
		%>
</table>
<jsp:include page="/eclinic_jsp/recruitment/tabmenu/MedicalStatusTab.jsp" />