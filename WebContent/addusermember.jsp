<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <script>
 
 $( window ).load(function() {
		var sesid = $('#createdby').val();
		$.ajax({
			url: "ListgroupidServlet",
			data:{ sesid : sesid },
			type: "POST",
			cache: false,
			success: function(dataResult){ 

				var data = JSON.parse(JSON.stringify(dataResult));//alert(data);
			    var len = data.length;
 			    for (var i = 0; i < len; i++) {
				   var id = data[i].id;
				   var memberid = data[i].memberid;
				   var groupid = data[i].groupid;}	    
 			    $('#org_selectmem').val(groupid);

				   
 			    }

	    	}) ; 	

	});    	



 $(document).ready( function() {		
		var sesid = $('#createdby').val();

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
		<td width="100px" class="gender'+newid+'">' + $("input[name='gender']:checked").val() + '</td>\n\
		<td width="100px" class="dob'+newid+'">' + $("#dob").val() + '</td>\n\
		<td width="100px" class="address'+newid+'">' + $("#address").val() + '</td>\n\
		<td width="100px" class="relation'+newid+'">' + $("#relation option:selected").val()  + '</td>\n\
		<td width="100px" class="city'+newid+'">' + $("#city").val() + '</td>\n\
		<td width="100px" class="state'+newid+'">' + $("#state").val() + '</td>\n\
		<td width="100px" class="country'+newid+'">' + $("#country").val() + '</td>\n\
		<td width="100px" class="zip'+newid+'">' + $("#zip").val() + '</td>\n\
/* 		<td width="100px" class="organization'+newid+'">' + $("#org_selectmem").val()  + '</td>\n\
 */		<td width="100px"><a href="javascript:void(0);" class="remCF btn btn-warning">Remove</a></td>\n\ </tr>');          
			
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
			gender.push($("#"+i+" .gender"+i).html());
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
		//alert(organization);

		$.ajax({
			url: "AddmultimemServlet",
			type: "POST",
			data: {sesid:sesid, fname : fname, lname: lname, email : email, phone : phone, gender:gender,relation:relation, address:address, dob:dob, organization:organization ,city:city, state:state, country:country, zip:zip, id:lastRowId },		
			success : function(data){
				alert("Data Added Successfully"); 
                window.location.reload();						
			}
			});
		});
		});


    
    </script>
    
<div class="card bg-warning text-info">
Add Member

<div class="container-fluid">
	<div class="row">
 
 
 
				<div class="form-group">
					<input type="hidden" id="createdby"
					value="<%= session.getAttribute("name") %>">
				</div>

								<div class="form-group col-sm-4" >
					<input type="text" id="fname" name="fname" class="form-control"
						placeholder="FirstName" required>
				</div>
								<div class="form-group col-sm-4" >
					<input type="text" id="lname" name="lname" class="form-control"
						placeholder="LastName" required>
				</div>
								<div class="form-group col-sm-4" >
				    <input type="email" id="email" name="email" class="form-control"
					placeholder="Email " required>
			    </div>
			    <div class=clearfix></div>
			    <div class="form-group  col-sm-4">
				   <input type="phone" id="phone" name="phone" class="form-control" placeholder="Phone" required>
				</div>		
								<div class="form-group col-sm-4" >
                       			 <input type="text" id="dob" class=form-control placeholder="*Date of Birth" onfocus="(this.type='date')" onblur="(this.type='text')" >
                       		 </div>
			    
								<div class="form-group col-sm-4" >
				
					<div class="radio-item">
				    <input type="radio" id="ritema" name="gender" value="M">
				    <label for="ritema">Male</label>
				    </div>
				
				    <div class="radio-item">
				    <input type="radio" id="ritemb" name="gender" value="F">
				    <label for="ritemb">Female</label>
				    </div>
				</div>
			<div class=clearfix></div>
								<div class="form-group col-sm-4" >
					<textarea id="address" rows="4" cols="50" placeholder="Address" class="form-control"></textarea>
				</div>
								<div class="form-group col-sm-4" >
                    <input type=text id="org_selectmem" class="form-control" disabled>
                               
                </div>
								<div class="form-group col-sm-4" >
						<select  id="relation" class="form-control" >
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
								<div class="form-group col-sm-4" >
			</div>
								<div class="form-group col-sm-4" >
			</div>
			
								<div class="form-group col-sm-4" >
				<button type="button" class="btn btn-success" id="btn-add_more">More</button>
				<input type="button"  name="save" class="btn btn-primary" value="Save" id="butsave">
			
		</div>
								<div class="form-group col-sm-12 "style="overflow-x: auto; overflow-y : auto;" >
			
			<table id="table1" name="table1" class="table table-responsive table-striped   ">
				<tbody>
					<tr class="info ">
						<th>ID</th>
						<th>FirstName</th>
						<th>LastName</th>
						<th>email</th>			
						<th>Phone</th>
						<th>Gender</th>
						<th>DOB</th>	
						<th>Address</th>					
						<th>Relation</th>
						<th>City</th>
						<th>State</th>
						<th>Country</th>
						<th>Zip</th>
					    <th>Group ID</th>
						<th>Action</th>
					<tr>
				</tbody>
			</table>
</div>
	</div>