<script>
	$(document).ready(function(e) {
			$.ajax({
				url: "ViewfamilylistServlet",
				type: "GET",
				cache: false,
				success: function(dataResult){ 
					var data = JSON.parse(JSON.stringify(dataResult));
				    var len = data.length;
	 			    for (var i = 0; i < len; i++) {
					   var id         = data[i].id;
					   var memberid   = data[i].memberid;
					   var firstname  = data[i].firstname;
					   var lastname   = data[i].lastname;
					   var email      = data[i].email;
					   var phone      = data[i].phone;
					   var address    = data[i].address;
					   var groupid    = data[i].groupid;
					   var relation   = data[i].relation;
					   $('#table_viewmember').append('<tr><td>'+memberid+'</td><td>'+firstname+" "+lastname+'</td><td>'+email+'</td><td>'+phone+'</td><td>'+address+'</td><td>'+groupid+'</td></tr>');

	 			    }
	 	      }
				
			});

			
			
		});
	
</script>
<body>

	<div class="container-fluid">
	
	<input type="hidden" id="idses"
		value="<%= session.getAttribute("name") %>">
	<table id="table_viewmember" class="table table-striped table-hover table-responsive">
		<tbody>
		<thead>
<!--       		<th>
				<span class="custom-checkbox">
				<input type="checkbox" id="selectAll">
				<label for="selectAll"></label>
				</span>
				</th>
 -->
 			<tr>
 				<th>Member ID</th>
				<th>Name</th>
				<th>Email</th>			
				<th>Phone</th>
				<th>Address</th>					
				<th>Family ID</th>
								
			</tr>
		</thead>
		</tbody>
	</table>
</div></body>