<%     
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
%>
<input type="hidden" id="type" value="<%=request.getAttribute("type") %>" />
<jsp:include page="/eclinic_jsp/recruitment/tabmenu/Vitals.jsp" />
<jsp:include page="/eclinic_jsp/recruitment/tabmenu/Notes.jsp" />