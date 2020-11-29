<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    
    <script>
    
         $(document).ready(function() {
             var email = $('#id_d').val();
             var hostname = $('#host').val();
             localStorage.setItem("email", email);
             localStorage.setItem("hostname", hostname);

             $.post("registerviswagokulamdashboard.html", function(data){

                 $('.modal-body').html(data);

           	});

         
			$.ajax({
				url: "viswafamilyServlet",
				data:{ email : email , hostname : hostname},
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
					   var password = data[i].password;
					   var yeardob = data[i].yeardob;
					   var address = data[i].address;
					   var relation = data[i].relation;
					   var username = data[i].username;
					   var khometown = data[i].khometown;
					   var mal = data[i].mal;
					   var hin = data[i].hin;
					   $('#table_viewmember').append('<tr><td>'+id+'</td><td>'+username+'</td><td>'+firstname+" "+lastname+'</td><td>'+email+'</td><td>'+phone+'</td><td>'+address+'</td><td>'+relation+'</td><td>'+gender+'</td><td>'+yeardob+'</td></tr>');

	 			    }
	 	      }
				
			});

			
			
		});
	

    </script>
<div class="container-fluid" style="overflow-x: auto; overflow-y : auto;">
<div class="col-md-12" style="  padding-bottom: 1em;">
<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
  Add Family Member
</button>

<!-- <h5> <p class="font-weight-bold">Family Members </p> </h5>
 -->

<input type="hidden" id="id_d" name="id" class="form-control" 	 value="<%= session.getAttribute("name") %>">
<input type="hidden" id="host" name="host" class="form-control"  value="<%= session.getAttribute("host") %>">

</div>
<div class="col-md-12  ">
<div class="modal" id="myModal" data-backdrop="static" data-keyboard="false" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Add Member</h4>
       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
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
				<th>Address</th>					
				<th>Relation</th>
				<th>Gender</th>
				<th>DOB</th>	
				
				
			<tr>
		</thead>
		</tbody>
		
	</table></div></div>

