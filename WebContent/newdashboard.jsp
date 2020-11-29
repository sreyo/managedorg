<% if (session.getAttribute("name") != null) { %>
<jsp:include page="dashbheader.jsp" />  
    
<div class="panel-body">
	
	
	<jsp:include page="listorg.jsp" />  
	
</div>

<jsp:include page="footer.jsp" />  
<% } else {%>
<jsp:include page="login.jsp" />  
    
<% } %>

