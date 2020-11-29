<script>

$(document).ready(function() {
    var sesid = $('#idses').val();
	$.ajax({
		url: "ViewsuborgServlet",
		data:{ sesid : sesid },
		type: "GET",
		cache: false,
		success: function(dataResult){ 
		var data = JSON.parse(JSON.stringify(dataResult));
		var len = data.length;
		for (var i = 0; i < len; i++) {
			   var id = data[i].id;
			   var orgid = data[i].orgid;
			   var name  = data[i].name;
			   var address = data[i].address;
			   var del='<a href="#deleteEmployeeModal" class="delete" data-id='+id+' data-toggle="modal"><i class="material-icons delete" data-toggle="tooltip"  title="Delete">delete</i></a></td></tr>';

			   $('#table').append('<tr><td>SUB-ID-'+id+'</td><td>'+orgid+'</td><td>'+name+'</td><td>'+address+'</td><td><a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons update" data-toggle="tooltip" data-id="'+id+'" data-name="'+name+'" data-address="'+address+'" title="Edit">edit</i>||'+del)
		}
	}
		
	});
});

$(document).on('click','#btn-add',function(e) {
    var createdby = $('#createdby').val();
	var data      = $("#user_form").serialize() + "&createdby=" + createdby;
	$.ajax({
		data: data,
		type: "POST",
		url: "AddorgServlet",
		success: function(dataResult){
					$('#addEmployeeModal').modal('hide');
					alert('Data added successfully !'); 
                    location.reload();						
				}
	
	});
});

$(document).on("click", ".delete", function() { 
	var id=$(this).attr("data-id");
	$('#id_d').val(id);
	
	
});
$(document).on("click", "#delete", function() { 
	$.ajax({
		url: "DelorgServlet",
		type: "POST",
		cache: false,
		data:{
			id: $("#id_d").val()
		},
		success: function(dataResult){
				$('#deleteEmployeeModal').modal('hide');
				$("#"+dataResult).remove();
                location.reload();						


		
		}
	});
});

$(document).on('click','.update',function(e) {
	var id=$(this).attr("data-id");
	var name=$(this).attr("data-name");
	var address=$(this).attr("data-address");
	$('#id_u').val(id);
	$('#name_u').val(name);
	$('#address_u').val(address);
});

 $(document).on('click','#update',function(e) {
	var data = $("#update_form").serialize();
	$.ajax({
		data: data,
		type: "POST",
		url: "UpdateorgServlet",
		success: function(dataResult){
					$('#editEmployeeModal').modal('hide');
					alert('Data updated successfully !'); 
                    location.reload();						
				
		}
	});
}); 


</script>


<body>

	<div class="table-title">
		<div class="row">
			<div class="col-sm-6">
				<h2></h2>
			</div>
			<div class="col-sm-10">
				<a href="#addEmployeeModal" class="btn btn-success"
					data-toggle="modal"><i class="material-icons"></i> <span>Add SubOrganization</span></a>
				<!-- <a href="JavaScript:void(0);" class="btn btn-danger" id="delete_multiple"><i class="material-icons"></i> <span>Delete</span></a>						
 -->
			</div>
		</div>
	</div>
	<input type="hidden" id="idses"
		value="<%= session.getAttribute("name") %>">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
<!--       						<th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
						</th>
 -->
				<th>SL</th>
				<th>Parent ID</th>
				<th>Name</th>
				<th>Address</th>
<!--            <th>Status</th>
		<th>Created By</th>
 -->
				<th>Action</th>
			</tr>
		</thead>
		<tbody id="table">

		</tbody>
	</table>
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="user_form">
					<div class="modal-header">
						<h4 class="modal-title">Add</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">&times;</button>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label>Name</label> <input type="text" id="name" name="name"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Address</label> <input type="email" id="address"
								name="address" class="form-control" required>
						</div>
						<div class="form-group input-group mb-3">
  <select class="custom-select" id="inputGroupSelect02">
    <option selected>Choose...</option>
    <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
  </select>
  <div class="input-group-append">
    <label class="input-group-text" for="inputGroupSelect02">Organization</label>
  </div>
</div>
						
 
						<div class="form-group">
							<input type="hidden" id="createdby"
								value="<%= session.getAttribute("name") %>">
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel">
						<button type="button" class="btn btn-success" id="btn-add">Add</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="update_form">
					<div class="modal-header">
						<h4 class="modal-title">Edit Organization</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="id_u" name="id" class="form-control"
							required>
						<div class="form-group">
							<label>Name</label> <input type="text" id="name_u" name="name"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>address</label> <input type="email" id="address_u"
								name="address" class="form-control" required>
						</div>
						<!-- 						<div class="form-group">
							<label>PHONE</label>
							<input type="phone" id="phone_u" name="phone" class="form-control" required>
						</div>
						<div class="form-group">
							<label>City</label>
							<input type="city" id="city_u" name="city" class="form-control" required>
						</div>					
 -->
					</div>
					<div class="modal-footer">
						<input type="hidden" value="2" name="type"> <input
							type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel">
						<button type="button" class="btn btn-info" id="update">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>

					<div class="modal-header">
						<h4 class="modal-title">Delete Organization</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="id_d" name="id" class="form-control">
						<p>Are you sure you want to delete these Records?</p>
						<p class="text-warning">
							<small>This action cannot be undone.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel">
						<button type="button" class="btn btn-danger" id="delete">Delete</button>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>