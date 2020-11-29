<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<style>
    .addmember {
        height: 100%;
        overflow-y: auto;
        width: 100% !important;
        height: 100% !important;
        margin: 0 !important;
        padding: 0 !important;
        max-width:none !important;

    }
    
   .modal-full {
    min-width: 20%;
    margin-left: 80;
    overflow-y: auto;
    
    
 }

.modal-full .modal-content {
    min-height: 100vh;
}
</style>
<script>  
 $(document).on('click','#btn-group',function(e) {
	    var org_select = $( "#org_select option:selected" ).text();
	    $("#org_selectmem").val(org_select);
	    $('#addMemberModal').modal('show');
 });

/* 	    var grouptype   = $('#grouptype').val();
	    var data       = $("#user_form").serialize() + "&org_select=" +org_select + "&grouptype=" + grouptype+ "&createdby=" + createdby;
	   // alert(+'ORG-ID-');
	    alert(data);
		$.ajax({
			data: data,
            timeout: 30000,
			type: "POST",
			url: "AddorgServlet",
			success: function(msg){	alert(msg);	
          				  if($.trim(msg) === "success") {
 				      $('#addGroupModal').modal('hide');
/*                           $.get('ListorgServlet',
		    	           		function(data) { var org= "--  Select Family-ID  --";
		    	                 var options = ''; 		
		    	                 options += '<option value="'+0+'" data-id="'+0+'">'+org+'</option>';
		    	                 $(data).each(function(index, value){	
		    		             options += '<option value="'+value.name+'" data-id="'+value.id+'">'+value.name+'</option>';
		    	           }) ; 	
		    	           $('#org_selectmem').html(options);

		                  });    	
 */
// $(".modal-body #bookId").val( myBookId );

/* 					}else{ alert("Error");}}
		
		});
 */	


	/* 	$(document).on('click','#btn-add1',function(e) {
		    var createdby = $('#createdby').val();
			var data      = $("#member_form").serialize() + "&createdby=" + createdby;alert(data);
			$.ajax({
				data: data,
				type: "POST",
				url: "AddmemServlet",
				success: function(dataResult){
							$('#addMemberModal').modal('hide');
							alert('Data added successfully !'); 
		                    location.reload();						
						}
			
			});
		});
	 */			 
	 $( window ).onload(function() {alert("1");
		    $.get('ListorgServlet',
		    	function(data) { var org= "-- Select Family-ID --";
		    	                 var options = ''; 		
		    	                 options += '<option value="'+0+'" data-id="'+0+'">'+org+'</option>';
		    	                 options += '<option value="'+1+'" data-id="'+1+'">'+"New Family"+'</option>';

		    	                 $(data).each(function(index, value){	
		    		             options += '<option value="'+value.name+'" data-id="'+value.groupid+'">'+value.groupid+'</option>';
		    	}) ; 	
		    	$('#org_select').html(options);

		});    	

		});
	
	 $(document).ready(function() {
		    var sesid = $('#idses').val();
			$.ajax({
				url: "ViewmemberServlet",
				data:{ sesid : sesid },
				type: "GET",
				cache: false,
				success: function(dataResult){ 
					var data = JSON.parse(JSON.stringify(dataResult));
				    var len = data.length;
	 			    for (var i = 0; i < len; i++) {
					   var id = data[i].id;
					   var firstname  = data[i].firstname;
					   var lastname = data[i].lastname;
					   var email = data[i].email;
	                   var orgid = data[i].orgid;
	                   var phone = data[i].phone;
	                   var relation = data[i].relation;
	                   var address = data[i].address;
	                   var group = data[i].groupid;
	                   var username = data[i].username;
	                   var createdby = data[i].createdby;
	                   var gender = data[i].gender;
	                   var password = data[i].password;
	                   var dob = data[i].dob;
	                   var city = data[i].city;
	                   var state = data[i].state;
	                   var country = data[i].country;
	                   var zip = data[i].zip;
					   var del='<a href="#deleteMemberModal" class="delete" data-id='+id+' data-toggle="modal"><i class="glyphicon glyphicon-remove-sign" data-toggle="tooltip"  title="Delete"></i></a>';
					   var col=' ';
				       var view ='<a href="#viewMemberModal" class="view" data-group='+group+' data-toggle="modal"><i class="glyphicon glyphicon-eye-open" data-toggle="tooltip"  title="View"></i></a></td></tr>';        
					   $('#table').append('<tr><td>MEMBER-ID-'+id+'</td><td>'+firstname+" "+lastname+'</td><td>'+group+'</td><td>'+email+'</td><td>'+phone+'</td><td></td><td><a href="#editMemberModal"  data-toggle="modal"><i class="update glyphicon glyphicon-edit" data-toggle="tooltip" data-id="'+id+'" data-fname="'+firstname+'"  data-lname="'+lastname+'" data-email="'+email+'" data-phone="'+phone+'" data-relation="'+relation+'" data-address="'+address+'" data-gender="'+gender+'" data-password="'+password+'" data-dob="'+dob+'" data-city="'+city+'" data-state="'+state+'" data-country= "'+country+'" data-zip="'+zip+'" title="Edit"></i>||'+del+'||'+view+'');
	 	               
	 			    }
	 	     }
				
			});
		
		});
     $(document).on('click','.view',function(e) {
 		   var id=$(this).attr("data-group");
			$.ajax({
				url: "ViewgroupServlet",
				data:{ id : id },
				type: "GET",
				cache: false,
				success: function(dataResult){ 
					var data = JSON.parse(JSON.stringify(dataResult));//alert(data);
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
					   var relation = data[i].relation;
					   var address = data[i].address;
					   var dob = data[i].dob;
					   $('#table_viewmember').append('<tr><td>'+memberid+'</td><td>'+firstname+" "+lastname+'</td><td>'+email+'</td><td>'+phone+'</td><td>'+gender+'</td><td>'+dob+'</td><td>'+address+'</td><td>'+relation+'</td><td>'+groupid+'</td><td><a href="#editMemberModal"  data-toggle="modal"><button class="btn glyphicon glyphicon-check" data-toggle="tooltip" data-id="'+id+'"  title="Approve"></button></td></tr>');

	 			    }
	 	      }
				
			});

			
			
		});
	
		$(document).ready( function() {
			
			var id = 1; 
          	/*Assigning id and class for tr and td tags for separation.*/
			$("#btn-add_more").click(function() {
			var newid = id++; 
			$("#table1").append('<tr valign="top" id="'+newid+'">\n\
			<td width="100px" >' + newid + '</td>\n\
			<td width="100px" class="fname'+newid+'">' + $("#fname").val() + '</td>\n\
			<td width="100px" class="lname'+newid+'">' + $("#lname").val() + '</td>\n\
			<td width="100px" class="email'+newid+'">' + $("#email").val() + '</td>\n\
			<td width="100px" class="phone'+newid+'">' + $("#phone").val() + '</td>\n\
			<td width="100px" class="gender'+newid+'">' + $("#gender").val() + '</td>\n\
			<td width="100px" class="dob'+newid+'">' + $("#dob").val() + '</td>\n\
			<td width="100px" class="address'+newid+'">' + $("#address").val() + '</td>\n\
			<td width="100px" class="relation'+newid+'">' + $("#relation option:selected").val()  + '</td>\n\
			<td width="100px" class="organization'+newid+'">' + $("#org_selectmem").val()  + '</td>\n\
			<td width="100px" class="city'+newid+'">' + $("#city").val() + '</td>\n\
			<td width="100px" class="state'+newid+'">' + $("#state").val() + '</td>\n\
			<td width="100px" class="country'+newid+'">' + $("#country").val() + '</td>\n\
			<td width="100px" class="zip'+newid+'">' + $("#zip").val() + '</td>\n\
			<td width="100px"><a href="javascript:void(0);" class="remCF btn btn-warning">Remove</a></td>\n\ </tr>');          
 			$('#member_form').find('input, select, textarea, checkbox').not("#org_selectmem").val('');
 			$('#gender :checked').removeAttr('checked');


			});		
			$("#table1").on('click', '.remCF', function() {
			$(this).parent().parent().remove();
			
			});
				
			/*crating new click event for save button*/
			$("#butsave").click(function() {
			var lastRowId = $('#table1 tr:last').attr("id");
			
			/*finds id of the last row inside table*/
			var fname = new Array(); 
			var lname = new Array(); 
			var email = new Array();
			var phone = new Array();
			var relation = new Array();
			var organization = new Array();
			var dob = new Array();
			var address = new Array();
			var gender = new Array();
			var city = new Array();
			var state = new Array();
			var country = new Array();
			var zip = new Array();

             
			for ( var i = 1; i <= lastRowId; i++) {
				fname.push($("#"+i+" .fname"+i).html()); /*pushing all the names listed in the table*/
				lname.push($("#"+i+" .lname"+i).html()); /*pushing all the names listed in the table*/
				email.push($("#"+i+" .email"+i).html()); /*pushing all the emails listed in the table*/
				phone.push($("#"+i+" .phone"+i).html()); /*pushing all the phone listed in the table*/
				relation.push($("#"+i+" .relation"+i).html()); /*pushing all the relation listed in the table*/
				organization.push($("#"+i+" .organization"+i).html()); /*pushing all the relation listed in the table*/
				address.push($("#"+i+" .address"+i).html()); /*pushing all the address listed in the table*/
				dob.push($("#"+i+" .dob"+i).html()); /*pushing all the dob listed in the table*/
				gender.push($("#"+i+" .gender"+i).html()); /*pushing all the dob listed in the table*/
				city.push($("#"+i+" .city"+i).html()); 
				state.push($("#"+i+" .state"+i).html()); 
				country.push($("#"+i+" .country"+i).html()); 
				zip.push($("#"+i+" .zip"+i).html()); 
				

            }
            

			var sendFname = JSON.stringify(fname); 
			var sendLname = JSON.stringify(lname); 
			var sendEmail = JSON.stringify(email);
			var sendPhone = JSON.stringify(phone);
			var sendrelation  = JSON.stringify(relation); 
            var created = email[0];

            $.ajax({
				url: "AddmultimemServlet",
				type: "POST",
				data: {sesid:created, fname : fname, lname: lname, email : email, phone : phone, gender:gender,relation:relation, address:address, dob:dob, organization:organization , city:city, state:state, country:country, zip:zip,id:lastRowId },		
				success : function(data){
					alert(data); 
                    location.reload();						
				}
				});
			});
			});
	
           $(function () {
                $( "#datepicker" ).datepicker();
			});
           
           $(document).on("click", ".delete", function() { 
        		var id=$(this).attr("data-id");
        		$('#id_d').val(id);
        		
        		
        	});

           $(document).on("click", "#delete", function() { 
        		$.ajax({
        			url: "DelmemServlet",
        			type: "GET",
        			cache: false,
        			data:{
        				id: $("#id_d").val()
        			},
        			success: function(dataResult){alert(dataResult);
        					$('#deleteMemberModal').modal('hide');
        					$("#"+dataResult).remove();
        	                location.reload();						


        			
        			}
        		});
        	});

           $(document).on('click','.update',function() {
        	   
        		var id		=	$(this).attr("data-id");
        		var fname	=	$(this).attr("data-fname");
        		var lname	=	$(this).attr("data-lname");
        		var email	=	$(this).attr("data-email");
        		var phone	=	$(this).attr("data-phone");
        		var dob  	=	$(this).attr("data-dob");
        		var gender	=	$(this).attr("data-gender");
        		var address	=	$(this).attr("data-address");
        		var relation=	$(this).attr("data-relation");
        		var city    =	$(this).attr("data-city");
        		var state   =	$(this).attr("data-state");
        		var country =	$(this).attr("data-country");
        		var zip     =	$(this).attr("data-zip");
        		$('#id_u').val(id);
        		$('#fname_u').val(fname);
        		$('#lname_u').val(lname);
        		$('#email_u').val(email);
        		$('#phone_u').val(phone);
        		$('#dob_u').val(dob);
			    $("[name=gender]").val([gender]);
			    $('[name=country]').val(country);
        		$('#address_u').val(address);
        		$('#relation_u').val(relation);
        		$('#city_u').val(city);
        		$('#state_u').val(state);
        		$('#country_u').val(country);
        		$('#zip_u').val(zip);

         	});


           $(document).on('click','#update',function() {
        		var data = $("#update_form").serialize();alert(data);
        		$.ajax({
        			data: data,
        			type: "POST",
        			url: "UpdatememServlet",
        			success: function(dataResult){
        						$('#editMemberModal').modal('hide');
        						alert('Data updated successfully !'); 
        	                    location.reload();						
        					
        			}
        		});
        	}); 

           $(document).on("click", ".cancel", function() { 
           location.reload();       		
       		
       	});
        // Basic example
	</script>
	
<body>

<!---------------------------------------- Adding Modal for Group  -->
  <div class="modal fade" id="addGroupModal" data-backdrop="false"
tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="user_form">
					<div class="modal-header">
						<h4 class="modal-title"></h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">&times;</button>
					</div>
					<div class="modal-body">

				        <div  class="form-group">
				            <label> Family ID</label> 
				            <select id="org_select" class="form-control" >
                            </select>
				        </div>
						 
						<div class="form-group">
							<input type="hidden" id="createdby"
								value="<%= session.getAttribute("name") %>">
						</div>
					</div>
					<div class="modal-footer">
					    <a href="#" class="btn btn-info" data-toggle="modal" id="btn-group" >		
	                    <i class="material-icons"></i> <span>Select</span></a>
						<input type="button" class="btn btn-danger" data-dismiss="modal" value="Cancel">
						
						
					</div>
				</form>
			</div>
		</div>
	</div>



<!---------------------------------------- End of Modal for Group  -->


	<div class="table-title">
		<div class="row">
			<div class="col-sm-6">
				<h2></h2>
			</div>
			<div class="col-sm-10">
	<!-- 		<a href="#addMemberModal" class="btn btn-success" data-toggle="modal">
	 -->		
	             <a href="#addGroupModal" class="btn btn-success" data-toggle="modal">		
	             <i class="material-icons"></i> <span>Add Member</span></a>
					<!-- <a href="JavaScript:void(0);" class="btn btn-danger" id="delete_multiple"><i class="material-icons"></i> <span>Delete</span></a>						
		             -->
			</div>
		</div>
	</div>
	<input type="hidden" id="idses"
		value="<%= session.getAttribute("name") %>">
	<table	class="table table-responsive table-striped table-hover table-sm table-dark">
		<thead >
			<tr >
				<th class="thead-dark">MEMBER ID</th>
				<th>Name</th>
			    <th>Group ID</th>
				<th>email</th>			
				<th>Phone</th>
				<th></th>
				<th>Action</th>
			
				<!--       						<th>
								<span class="custom-checkbox">
									<input type="checkbox" id="selectAll">
									<label for="selectAll"></label>
								</span>
							</th>
	-->
			</tr>
		</thead>
		<tbody id="table">

		</tbody>
	</table>
	<div id="addMemberModal" class="modal fade" >
		<div class="modal-dialog addmember" >
			<div class="modal-content">
				<form id="member_form">
					<div class="modal-header">
						<h4 class="modal-title">Add Member</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">&times;</button>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
								<div class="form-group col-sm-4" >
									<input type="text" id="fname" name="fname" class="form-control"
										placeholder="FirstName" required>
								</div>
								<div class="form-group col-sm-4">
									<input type="text" id="lname" name="lname" class="form-control"
										placeholder="LastName" required>
								</div>
								<div class="form-group col-sm-4">
								    <input type="email" id="email" name="email" class="form-control"
									placeholder="Email " required>
							    </div>
							    <div class=clearfix></div>
							    <div class="form-group  col-sm-4">
								   <input type="phone" id="phone" name="phone" class="form-control" placeholder="Phone" required>
								</div>		
								<div class="form-group col-sm-4">
                           			 <input type="date" id="dob" class=form-control placeholder="*Date of Birth" onfocus="(this.type='date')" onblur="(this.type='text')" >
                           		 </div>
							    
							    <div class="form-group col-md-4">
   									<label>Gender</label>
							
									<div class="checkbox-inline">
  									<label class="form-check-label">
  									<input type="checkbox" id="gender" class="form-check-input" value="M">Male
  									</label>
									</div>
									<div class="checkbox-inline">
 									 <label class="form-check-label">
   									 <input type="checkbox" id="gender" class="form-check-input" value="F">Female
 									 </label>
								</div>
							    
							  </div>
							<div class=clearfix></div>
								<div class="form-group col-sm-4">
									<textarea id="address" rows="4" cols="50" placeholder="Address" class="form-control"></textarea>
								</div>
							<div class="form-group  col-sm-4">
								   <input type="text" id="org_selectmem" name="org_selectmem" class="form-control"  disabled>
								</div>		
								
        						<div class="form-group  col-sm-4">
   									<select  id="relation" class="form-control">
										<option selected disabled> -- Select Relation --</option>
										<option  value="Individual">Individual</option>
										
										<option  value="Husband">Husband</option>
										<option  value="Wife">Wife</option>
										<option  value="child">child</option>
										<option  value="Father">Father</option>
										<option  value="Mother">Mother</option>
										<option  value="Sibling">Sibling</option>
										
									</select>
        						
							</div>
				                
							<div class=clearfix></div>
        <div class="form-group  col-sm-3">
			<input type="text" id="city" name="city" class="form-control"
										placeholder="City" required>
							
		</div>
		<div class="form-group  col-sm-3">
			<input type="text" id="state" name="state" class="form-control"
					placeholder="State" required>
		
		</div>
		
		<div class="form-group  col-sm-3">
           <select id="country" name="country" class="form-control">
              <option value="1">---Select Country---</option>
              
               <option value="USA">USA</option>
               <option value="UK">UK</option>
               <option value="UAE">UAE</option>
               <option value="INDIA">INDIA</option>
		</select>							
		</div>
        		<div class="form-group  col-sm-3">
			<input type="text" id="zip" name="zip" class="form-control"
					placeholder="Zip" required>
		
		</div>
        
							<div class=clearfix></div>
							<div class="form-group  col-sm-4">
							</div>
							<div class="form-group  col-sm-4">
							</div>
							
						    <div class="form-group  col-sm-4">
								<button type="button" class="btn btn-success" id="btn-add_more">More</button>
								<button type="button"  name="save" class="btn btn-primary" id="butsave">Save</button>
								<button type="button"  class="btn btn-danger" data-dismiss="modal" >Cancel</button>
							</div>
							
						</div>
					</div>
					<table id="table1" name="table1" class="table table-responsive table-striped   table-sm">
						<tbody>
							<tr class="info ">
								<th>ID</th>
								<th>FirstName</th>
								<th>LastName</th>
								<th>Email</th>			
								<th>Phone</th>
								<th>Gender</th>
								<th>DOB</th>	
								<th>Address</th>					
								<th>Relation</th>
								<th>Family ID</th>
								
								<th>Action</th>
							<tr>
						</tbody>
					</table>

				</form>
			</div>
	    </div>
	</div>


	<div id="editMemberModal" class="modal fade">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<form id="update_form">
					<div class="modal-header">
						<h4 class="modal-title">Edit Member</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
								<input type="hidden" id="id_u" name="id" class="form-control">
						      <div class="form-group col-sm-4" >
									<input type="text" id="fname_u" name="fname" class="form-control"
										placeholder="FirstName" required>
								</div>
								<div class="form-group col-sm-4">
									<input type="text" id="lname_u" name="lname" class="form-control"
										placeholder="LastName" required>
								</div>
								<div class="form-group col-sm-4">
								    <input type="email" id="email_u" name="email" class="form-control"
									placeholder="Email " required>
							    </div>
							    <div class=clearfix></div>
							    <div class="form-group  col-sm-4">
								   <input type="phone" id="phone_u" name="phone" class="form-control" placeholder="Phone" required>
								</div>		
								<div class="form-group col-sm-4">
                           			 <input type="text" id="dob_u" name="dob" class=form-control placeholder="*Date of Birth" onfocus="(this.type='date')" onblur="(this.type='text')" >
                           		 </div>
							    
           <div class="form-group col-sm-4" >
			<label class="radio-inline"><input type="radio" name="gender" value="M" >Male</label>
			<label class="radio-inline"><input type="radio" name="gender" value="F">Female</label>
			</div>    
							<div class=clearfix></div>
								<div class="form-group col-sm-4">
									<textarea id="address_u" name="address" rows="4" cols="50" placeholder="Address" class="form-control"></textarea>
								</div>
<!-- 								<div class="form-group col-sm-4">
				                    <select id="org_selectmem_u" class="form-control" multiple select2>
                                   </select>
				                </div>
 -->        						<div class="form-group  col-sm-4">
   									<select  id="relation_u" name="relation" class="form-control">
										<option selected disabled> -- Select Relation --</option>
										<option  value="Individual">Individual</option>
										
										<option  value="Husband">Husband</option>
										<option  value="Wife">Wife</option>
										<option  value="child">child</option>
										<option  value="Father">Father</option>
										<option  value="Mother">Mother</option>
										<option  value="Sibling">Sibling</option>
										
									</select>
        						
							</div>
							        <div class="form-group  col-sm-4">
			<input type="text" id="city_u" name="city" class="form-control"
										placeholder="City" required>
							
		</div>
							
				                
							<div class=clearfix></div>
		<div class="form-group  col-sm-4">
			<input type="text" id="state_u" name="state" class="form-control"
					placeholder="State" required>
		
		</div>
		
		<div class="form-group  col-sm-4">
           <select id="country_u" name="country" class="form-control">
              <option value="1">Select Country</option>
              
               <option value="USA">USA</option>
               <option value="UK">UK</option>
               <option value="UAE">UAE</option>
               <option value="INDIA">INDIA</option>
		</select>							
		</div>
        		<div class="form-group  col-sm-4">
			<input type="text" id="zip_u" name="zip" class="form-control"
					placeholder="Zip" required>
		
		</div>
        
							<div class=clearfix></div>
							<div class=clearfix></div>
							<div class="form-group  col-sm-4">
							</div>
							<div class="form-group  col-sm-4">
							</div>
							
					<div class="modal-footer">
						<input type="hidden" value="2" name="type"> <button
							type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-info" id="update">Update</button>
					</div>
							
						</div>
					</div>

				</form>
			</div>
	    </div>
	</div>


	<!-- Delete Modal HTML -->
	<div id="deleteMemberModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>

					<div class="modal-header">
						<h4 class="modal-title">Delete User</h4>
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
	
	<div id="viewMemberModal" class="modal fade">
		<div class="modal-dialog  addmember">
			<div class="modal-content">
				<form>

					<div class="modal-header">
						<h4 class="modal-title">View Family Members </h4>
<!-- 						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">&times;</button>
 -->					</div>
					<div class="container-fluid">
					
					<div class="modal-body">
						<input type="hidden" id="id_d" name="id" class="form-control">
					   <table id="table_viewmember" name="tableview" class="table table-responsive table-striped   table-sm">
						<tbody>
						
						<thead>
							<tr class="info ">
								<th>ID</th>
								<th>Name</th>
								<th>email</th>			
								<th>Phone</th>
								<th>Gender</th>
								<th>DOB</th>	
								<th>Address</th>					
								<th>Relation</th>
								<th>Family ID</th>
								
								<th>Action</th>
							<tr>
						</thead>
						</tbody>
						
					</table>
				</div>
				</div>
					<div class="modal-footer">
						<input type="button" class="cancel btn btn-info" data-dismiss="modal"
							value="Close">
						
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>