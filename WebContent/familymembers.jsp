<% if (session.getAttribute("name") != null) { %>

<jsp:include page="userheader.jsp" />  
    
<div class="panel-body">
	
<jsp:include page="memberlist.jsp" />  
		
</div>

<jsp:include page="userfooter.jsp" />  
<% } else {%>

<jsp:include page="login.jsp" />  
<% } %>
