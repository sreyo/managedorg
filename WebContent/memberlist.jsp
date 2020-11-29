<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    
    <script>
         $(document).ready(function(e) {
         var email = $('#id_d').val();
			$.ajax({
				url: "viewfamilyServlet",
				data:{ email : email },
				type: "GET",
				cache: false,
				success: function(dataResult){ 
					var data = JSON.parse(JSON.stringify(dataResult));//alert(JSON.stringify(dataResult));
				    var len = data.length;
	 			    for (var i = 0; i < len; i++) {
					   var id = data[i].id;
					   var memberid = data[i].memberid;
					   var firstname  = data[i].firstname;
					   var lastname  = data[i].lastname;
					   var email = data[i].email;
					   var phone = data[i].phone;
					   var gender = data[i].gender;
					   var groupid = data[i].groupid;
					   var dob = data[i].dob;
					   var address = data[i].address;
					   var relation = data[i].relation;
					   var username = data[i].username;
					   $('#table_viewmember').append('<tr><td>'+memberid+'</td><td>'+username+'</td><td>'+firstname+" "+lastname+'</td><td>'+email+'</td><td>'+phone+'</td><td>'+groupid+'</td><td>'+address+'</td><td>'+relation+'</td><td>'+gender+'</td><td>'+dob+'</td></tr>');

	 			    }
	 	      }
				
			});

			
			
		});
	

    </script>
<div class="container-fluid" style="overflow-x: auto; overflow-y : auto;">
<div class="col-md-12  ">
<h5> <p class="font-weight-bold">Family Members </p> </h5>


<input type="hidden" id="id_d" name="id" class="form-control" 	value="<%= session.getAttribute("name") %>">

</div>

	   	<table id="table_viewmember" class="table table-striped table-hover table-responsive">
	   
		<tbody>
		
		<thead>
			<tr class="info ">
				<th>ID</th>
				<th>User ID</th>
				<th width="30%">Name</th>
				<th>email</th>			
				<th>Phone</th>
				<th>Group ID</th>
				<th>Address</th>					
				<th>Relation</th>
				<th>Gender</th>
				<th>DOB</th>	
				
				
			<tr>
		</thead>
		</tbody>
		
	</table></div>

