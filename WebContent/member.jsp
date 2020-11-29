<% if (session.getAttribute("name") != null) { %>

<jsp:include page="dashbheader.jsp" />  
    
<div class="panel-body">
	
<jsp:include page="managemember.jsp" />  
	
	
</div>
<% } else {%>

<jsp:include page="footer.jsp" />  
<% } %>
