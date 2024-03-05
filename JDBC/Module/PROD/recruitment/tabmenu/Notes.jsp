
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ page import="eclinic.registration.bean.RecruitmentBean" %>
<%
	RecruitmentBean note = (RecruitmentBean) request.getAttribute("notes");
	String notes_id = "", notes = "";
	if(note != null) {
		notes_id = String.valueOf(note.getSerial_id());
		notes = note.getNotes();
	}
%>
<input type="hidden" id="notes_id" value="<%=notes_id %>" />
<input type="hidden" id="old_notes" value="<%=notes %>" />
<table class="fheading33">
	<tr>
		<th background="/eclinic/images/shade.gif"><b><bean:message key="global.app.note" /></b></th>
	</tr>
	<tr>
		<td><textarea id="notes" rows="3" style="width: 75%;" onblur="updateRecruitmentNotes()"><%=notes %></textarea></td>
	</tr>
</table>