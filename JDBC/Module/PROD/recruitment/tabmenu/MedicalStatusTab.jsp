
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ page import="eclinic.registration.bean.RecruitmentBean" %>
<%
	RecruitmentBean note = (RecruitmentBean) request.getAttribute("notes");
	String notes_id = "", notes = "";
	if(note != null) {
		notes_id = String.valueOf(note.getSerial_id());
		notes = note.getNotes();
	}
	RecruitmentBean medical_status = (RecruitmentBean) request.getAttribute("status");
	String status_id = "", status = "";
	if(medical_status != null) {
		status_id = String.valueOf(medical_status.getSerial_id());
		status = medical_status.getMedical_status();
	}
%>
<input type="hidden" id="type" value="<%=request.getAttribute("type") %>" />
<input type="hidden" id="notes_id" value="<%=notes_id %>" />
<input type="hidden" id="old_notes" value="<%=notes %>" />
<input type="hidden" id="status_id" value="<%=status_id %>" />
<input type="hidden" id="med_status" value="<%=status %>" />
<table class="fheading33">
	<tr>
		<th background="/eclinic/images/shade.gif" colspan="2"><b>Fitness</b></th>
	</tr>
	<tr>
		<td width="25%"><bean:message key="global.common.status" /></td>
		<td>&nbsp;<select id="medical_status" class="text1" onchange="updateRecruitmentStatus()">
				<option value=""><bean:message key="global.common.selectAnOption" /></option>
				<option value="F">FIT</option>
				<option value="UF">UN FIT</option>
		</select></td>
	</tr>
</table>
<table class="fheading33">
	<tr>
		<th background="/eclinic/images/shade.gif"><b><bean:message
					key="global.app.note" /></b></th>
	</tr>
	<tr>
		<td><textarea id="notes" rows="3" style="width: 75%;" onblur="updateRecruitmentNotes()"><%=notes %></textarea></td>
	</tr>
</table>