
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ page import="eclinic.registration.bean.RecruitmentBean"%>
<%
	RecruitmentBean note = (RecruitmentBean) request.getAttribute("notes");
	String notes_id = "", notes = "";
	if (note != null) {
		notes_id = String.valueOf(note.getSerial_id());
		notes = note.getNotes();
	}
%>
<div class="modal-dialog">
	<div class="modal-content">
		<input type="hidden" id="notes_id" value="<%=notes_id%>" /> <input
			type="hidden" id="old_notes" value="<%=notes%>" />
		<table class="fheading33">
			<tr>
				<th background="/eclinic/images/shade.gif"><div class="modal-header">
						<b><bean:write name="heading" /></b>
					</div></th>
			</tr>
			<tr>
				<td><textarea id="notes" rows="3" style="width: 75%;"><%=notes %></textarea></td>
			</tr>
			<tr>
				<th colspan="1"><div class="modal-footer">
						<input type="button" class="buttonff" name="button" id="subBtn" onclick="updateRecruitmentNotesModal()" value="Update" />
						&nbsp;&nbsp;<button type="button" class="buttonff" data-dismiss="modal">Cancel</button>
					</div></th>
			</tr>
		</table>
	</div>
</div>